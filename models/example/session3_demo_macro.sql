{{ config(materialized='table') }}

{% set price = 100 %}
{% set discount = 30 %}

select
    {{ price }} as original_price,
    {{ discount }} as discount_percent,

    -- Using the macro here to calculate discount
    {{ calculate_discount(price, discount) }} as final_price
