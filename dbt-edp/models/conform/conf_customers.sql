with stg_customers as (
    select * from {{ ref('stg_customers') }}
)

select
    customer_id,
    upper(trim(customer_name)) as customer_name,
    lower(trim(email)) as email,
    status as customer_status,
    case 
        when status = 'ACTIVE' then true 
        else false 
    end as is_active,
    created_at,
    updated_at,
    current_timestamp() as conformed_at
from stg_customers
