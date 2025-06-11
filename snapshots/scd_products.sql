{% snapshot scd_products %}
{{
    config(
        target_database='rehab-cdp-dev',
        target_schema='snapshots',
        unique_key='product_id',
        strategy='timestamp',
        updated_at='updated_at'
    )
}}

select * from {{ source('test_dbt_cloud', 'products') }}

{% endsnapshot %}
