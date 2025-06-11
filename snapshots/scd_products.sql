{% snapshot scd_products %}
{{
    config(
        target_database='test_dbt_cloud',
        target_schema='snapshots',
        unique_key='product_id',
        strategy='timestamp',
        updated_at='updated_at'
    )
}}

select * from {{ source('raw', 'products') }}

{% endsnapshot %}
