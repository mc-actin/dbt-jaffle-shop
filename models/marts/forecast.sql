with forecasts as (

    select
        forecast_id,
        customer_id,
        customer_name,
        country,
        region,
        year,
        month,
        forecast_month,
        forecast_amount,
        currency,
        version_number,
        modified_at
    from {{ ref('stg_forecast') }}
    where country = 'United States'

)

select * from forecasts
