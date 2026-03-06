with source as (
    select
        1 as order_id,
        1 as customer_id,
        'ORD-001' as order_number,
        100.00 as order_amount,
        'COMPLETED' as order_status,
        current_date() - 5 as order_date,
        current_timestamp() as created_at
)

select * from source
