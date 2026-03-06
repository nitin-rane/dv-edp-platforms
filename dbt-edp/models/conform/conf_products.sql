with stg_products as (
    select * from {{ ref('stg_products') }}
)

select
    product_id,
    upper(trim(product_name)) as product_name,
    upper(trim(category)) as category,
    unit_price,
    case 
        when unit_price >= 100 then 'PREMIUM'
        when unit_price >= 50 then 'STANDARD'
        else 'BUDGET'
    end as price_tier,
    is_active,
    created_at,
    current_timestamp() as conformed_at
from stg_products
