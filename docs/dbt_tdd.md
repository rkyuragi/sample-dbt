# dbt で実践するテスト駆動開発 (TDD)

dbt におけるテスト駆動開発 (TDD) の基本サイクル "RED -> GREEN -> REFACTOR" をサンプルコード付きで解説します。

## シナリオ

顧客ごとの注文サマリーを作成します。各顧客の最初の注文日、最新の注文日、注文総数、総売上を計算します。

## TDD のステップ

1. **RED**: まずテストを書き、失敗することを確認します。
2. **GREEN**: テストを通すためにモデルを実装します。
3. **REFACTOR**: テストを維持したままコードを整理します。

### 準備

1. `packages.yml` に `dbt-utils` を追加し `dbt deps` を実行します。
2. `models/staging/stg_orders.sql` に仮の注文データを用意します。

```yaml
# packages.yml
packages:
  - package: dbt-labs/dbt_utils
    version: [">=1.0.0", "<2.0.0"]
```

```sql
-- models/staging/stg_orders.sql
with source_orders as (
    select 1 as order_id, 101 as customer_id, '2023-01-10'::date as order_date, 100.00 as order_amount
    union all
    select 2 as order_id, 102 as customer_id, '2023-01-11'::date as order_date, 150.00 as order_amount
    union all
    select 3 as order_id, 101 as customer_id, '2023-01-05'::date as order_date, 75.00 as order_amount
    union all
    select 4 as order_id, 103 as customer_id, '2023-01-20'::date as order_date, 50.00 as order_amount
    union all
    select 5 as order_id, 101 as customer_id, '2023-01-15'::date as order_date, 200.00 as order_amount
    union all
    select 6 as order_id, 102 as customer_id, '2023-01-09'::date as order_date, 120.00 as order_amount
    union all
    select 7 as order_id, 104 as customer_id, '2023-02-01'::date as order_date, -25.00 as order_amount
    union all
    select 8 as order_id, 105 as customer_id, '2023-02-10'::date as order_date, 0.00 as order_amount
)
select * from source_orders
```

### RED フェーズ

`fct_customer_summary` モデルに対するテストを先に書きます。

```yaml
# models/marts/fct_customer_summary.yml
version: 2

models:
  - name: fct_customer_summary
    description: "Aggregated summary of orders per customer, showing first/last order dates, total orders, and total revenue."
    columns:
      - name: customer_id
        description: "Unique identifier for the customer."
        tests:
          - unique
          - not_null
      - name: first_order_date
        description: "The date of the customer's first order."
        tests:
          - not_null
      - name: last_order_date
        description: "The date of the customer's most recent order."
        tests:
          - not_null
      - name: total_orders
        description: "The total number of orders placed by the customer."
        tests:
          - not_null
          - dbt_utils.accepted_range:
              min_value: 1
      - name: total_revenue
        description: "The total revenue generated from the customer."
        tests:
          - not_null
```

```sql
-- tests/assert_first_order_date_lte_last_order_date.sql
select
    customer_id,
    first_order_date,
    last_order_date
from {{ ref('fct_customer_summary') }}
where first_order_date > last_order_date
```

```sql
-- models/marts/fct_customer_summary.sql
-- RED フェーズの例 (誤った実装)
select
    customer_id,
    max(order_date) as first_order_date,
    min(order_date) as last_order_date,
    count(order_id) as total_orders,
    sum(order_amount) as total_revenue
from {{ ref('stg_orders') }}
group by customer_id
```

### GREEN フェーズ

テストを通すためにモデルを修正します。

```sql
-- models/marts/fct_customer_summary.sql
select
    customer_id,
    min(order_date) as first_order_date,
    max(order_date) as last_order_date,
    count(order_id) as total_orders,
    sum(order_amount) as total_revenue
from {{ ref('stg_orders') }}
group by customer_id
```

テストが成功したら、必要に応じてリファクタリングを行います。
