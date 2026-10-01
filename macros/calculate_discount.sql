
{% macro calculate_discount(price, discount_percent) %}
    {{ price }} * (1 - {{ discount_percent }} / 100)
{% endmacro %}