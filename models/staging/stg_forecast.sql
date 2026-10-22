with source as (

    select * from {{ source('forecast', 'forecast_raw') }}

),

renamed as (

    select
        trim(forecast_id) as forecast_id,
        nullif(trim(customer_id), '') as customer_id,
        trim(customer_name) as customer_name,
        trim(country) as country,
        trim(region) as region,
        year,
        month,
        date_from_parts(year, month, 1) as forecast_month,
        forecast_amount,
        trim(currency) as currency,
        version_number,
        modified_at
    from source

)

select * from renamed
