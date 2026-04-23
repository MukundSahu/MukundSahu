{% macro discounted_amt(extended_price,discounted_percentage)%}
(-1 * {{extended_price}} *{{discounted_percentage}}):: decimal(16,2)
{%endmacro%}