with

customers as (

    select * from {{ ref('stg_dim_customer') }}

)

select * from customers