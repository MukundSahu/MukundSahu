select
    line_item.part_key,
    line_item.line_number,
    line_item.extended_price,
    orders.order_key,
    orders.cust_key,
    orders.order_date,
    {{ discounted_amt(
        'line_item.extended_price',
        'line_item.discount_percentage'
    ) }} as item_discount_amount
from {{ ref('orders') }} as orders
join {{ ref('lineitem') }} as line_item
    on orders.order_key = line_item.order_key
order by orders.order_date