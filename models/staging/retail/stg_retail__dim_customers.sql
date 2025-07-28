with 

source as (

    select * from {{ source('retail', 'dim_customers') }}

),

renamed as (

    select
        customer_id,
        customer_name,
        email,
        region,
        signup_date

    from source

)

select * from renamed
