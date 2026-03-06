with conf_orders as (
    select * from {{ ref('conf_orders') }}
)

select
    order_id,
    order_number,
    customer_id,
    customer_name,
    order_amount,
    order_status,
    is_completed,
    order_date,
    order_month,
    order_year,
    created_at,
    current_timestamp() as loaded_at
from conf_orders
