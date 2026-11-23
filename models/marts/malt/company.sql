with

company as (

    select * from {{ ref('stg_company') }}

)

select * from company
