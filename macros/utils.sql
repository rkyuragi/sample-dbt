{% macro generate_schema_name_with_env(custom_schema_name) %}
    {%- if target.name == 'dev' -%}
        {{ custom_schema_name }}_dev
    {%- elif target.name == 'prod' -%}
        {{ custom_schema_name }}_prod
    {%- else -%}
        {{ custom_schema_name }}_default
    {%- endif -%}
{% endmacro %}

{% macro get_payment_type_description(payment_type_column) %}
    case {{ payment_type_column }}
        when 1 then 'Credit Card'
        when 2 then 'Bank Transfer'
        when 3 then 'Cash on Delivery'
        when 4 then 'Coupon'
        else 'Other'
    end
{% endmacro %}

{% macro add_audit_columns(created_at_alias='created_at', updated_at_alias='updated_at') %}
    current_timestamp as {{ created_at_alias }},
    current_timestamp as {{ updated_at_alias }}
{% endmacro %}

