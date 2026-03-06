with conf_orders as (
    select * from {{ ref('conf_orders') }}
)

select
    order_month as report_month,
    order_year as report_year,
    count(distinct order_id) as total_orders,
    count(distinct customer_id) as unique_customers,
    sum(order_amount) as total_revenue,
    avg(order_amount) as avg_order_value,
    sum(case when is_completed then 1 else 0 end) as completed_orders,
    sum(case when is_completed then order_amount else 0 end) as completed_revenue,
    current_timestamp() as loaded_at
from conf_orders
group by order_month, order_year
