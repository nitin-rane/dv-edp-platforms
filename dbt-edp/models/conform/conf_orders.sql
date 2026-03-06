with stg_orders as (
    select * from {{ ref('stg_orders') }}
),

stg_customers as (
    select * from {{ ref('stg_customers') }}
)

select
    o.order_id,
    o.order_number,
    o.customer_id,
    c.customer_name,
    o.order_amount,
    o.order_status,
    case 
        when o.order_status = 'COMPLETED' then true 
        else false 
    end as is_completed,
    o.order_date,
    date_trunc('month', o.order_date) as order_month,
    date_trunc('year', o.order_date) as order_year,
    o.created_at,
    current_timestamp() as conformed_at
from stg_orders o
left join stg_customers c on o.customer_id = c.customer_id
