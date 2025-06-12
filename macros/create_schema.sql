{% macro create_schema_if_not_exists() %}
  {% if target.name.startswith('dbt_cloud_pr_') %}
    {% set schema_name = target.schema %}
    {% set create_schema_sql %}
      CREATE SCHEMA IF NOT EXISTS `{{ target.database }}.{{ schema_name }}`
      OPTIONS(location="{{ target.location | default('us-central1') }}")
    {% endset %}
    {{ log("Creating schema if not exists: " ~ schema_name, info=true) }}
    {% do run_query(create_schema_sql) %}
  {% endif %}
{% endmacro %}