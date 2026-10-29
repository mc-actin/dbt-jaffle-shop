select
    mandant_id,
    company_id,
    company_name,
    company_city,
    country_code,
    country_label,
    currency_code,
    company_group_id,
    company_address_id,
    business_unit
from {{ source('forecast', 'dim_company') }}
