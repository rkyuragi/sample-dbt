{# macros/get_custom_schema.sql または macros/utils.sql #}
{% macro generate_schema_name(custom_schema_name, node) -%}
    {%- set default_schema = target.schema -%} {# profiles.yml のスキーマ #}

    {%- if custom_schema_name is none -%}
        {# モデル設定でスキーマが指定されていない場合は、デフォルトスキーマを使用 #}
        {%- set schema_to_process = default_schema -%}
    {%- else -%}
        {# モデル設定でスキーマが指定されている場合は、そのスキーマ名を使用 #}
        {%- set schema_to_process = custom_schema_name -%}
    {%- endif -%}

    {# 環境名に基づいて接尾辞を追加 #}
    {%- if target.name == 'dev' -%}
        {{ schema_to_process }}_dev
    {%- elif target.name == 'prod' -%}
        {{ schema_to_process }}_prod
    {%- else -%}
        {{ schema_to_process }}_default
    {%- endif -%}
{%- endmacro %}