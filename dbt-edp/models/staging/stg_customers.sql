with source as (
    select
        1 as customer_id,
        'John Doe' as customer_name,
        'john.doe@email.com' as email,
        'ACTIVE' as status,
        current_timestamp() as created_at,
        current_timestamp() as updated_at
)

select * from source
