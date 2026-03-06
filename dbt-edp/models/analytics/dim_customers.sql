with conf_customers as (
    select * from {{ ref('conf_customers') }}
),

conf_orders as (
    select * from {{ ref('conf_orders') }}
),

customer_orders as (
    select
        customer_id,
        count(*) as total_orders,
        sum(order_amount) as total_spend,
        avg(order_amount) as avg_order_value,
        min(order_date) as first_order_date,
        max(order_date) as last_order_date
    from conf_orders
    group by customer_id
)

select
    c.customer_id,
    c.customer_name,
    c.email,
    c.customer_status,
    c.is_active,
    coalesce(o.total_orders, 0) as total_orders,
    coalesce(o.total_spend, 0) as total_spend,
    coalesce(o.avg_order_value, 0) as avg_order_value,
    o.first_order_date,
    o.last_order_date,
    datediff('day', o.first_order_date, o.last_order_date) as customer_tenure_days,
    case
        when o.total_spend >= 1000 then 'PLATINUM'
        when o.total_spend >= 500 then 'GOLD'
        when o.total_spend >= 100 then 'SILVER'
        else 'BRONZE'
    end as customer_tier,
    c.created_at,
    current_timestamp() as loaded_at
from conf_customers c
left join customer_orders o on c.customer_id = o.customer_id
