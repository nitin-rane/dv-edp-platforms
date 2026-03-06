with source as (
    select
        1 as product_id,
        'Widget Pro' as product_name,
        'Electronics' as category,
        49.99 as unit_price,
        true as is_active,
        current_timestamp() as created_at
)

select * from source
