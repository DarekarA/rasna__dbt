

---- MATERIALIZATIONS
{{ config(materialized='table') }} -- table/view/ephemeral

---- LOCAL VARIABLES
{% set local_var = 150 %}
{% set env = 'dev' %}

with source_data as (

    select 1 as id
    union all
    select 2 as id
    union all
    select 3 as id
    union all
    select {{local_var}} as id
    union all
    select {{ var('payment_threshold')}} as id
    union all
    {% if env == 'prod' %}
        -- 100 id if env == prod
    SELECT 200 as id
    {% else %}
        -- simplified tax for development
    SELECT 0 as id
    {% endif %}
)

select *
from source_data

/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null
