{% snapshot scd_products %}
{{
    config(
        target_database=env_var('DBT_GOOGLE_CLOUD_PROJECT'),
        target_schema='snapshots',
        unique_key='product_id',
        strategy='timestamp',
        updated_at='updated_at'
    )
}}

select * from {{ source('test_dbt_cloud', 'products') }}

{% endsnapshot %}
