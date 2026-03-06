with conf_products as (
    select * from {{ ref('conf_products') }}
)

select
    product_id,
    product_name,
    category,
    unit_price,
    price_tier,
    is_active,
    created_at,
    current_timestamp() as loaded_at
from conf_products
