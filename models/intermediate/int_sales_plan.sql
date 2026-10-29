with sales_plan as (

    select * from {{ ref('stg_sales_plan') }}

),

final as (

    select
        fiscal_year,
        fiscal_period,
        calendar_date,
        company_id,
        sales_organization_id,
        business_unit,
        bu_currency,
        profit_center_id,
        contract_id,
        item_id,
        billing_local_currency,
        local_currency,
        delivered_customer_id,
        delivered_internal_external,
        invoiced_customer_id,
        invoiced_internal_external,
        hedging_rate,
        contract_yield,
        contract_status,
        lta_or_spot,
        incoterms_code,
        activity,
        product_type,
        material_group_name,
        specificity,
        scenario,
        quantity,
        unit_selling_expenses_amount_lc,
        unit_selling_expenses_amount_eur,
        unit_logistic_costs_amount_lc,
        unit_logistic_costs_amount_eur,
        unit_structured_products_amount_lc,
        unit_structured_products_amount_eur,
        unit_raw_materials_cost_amount_lc,
        unit_raw_materials_cost_amount_eur,
        unit_commercial_margin_eur,
        unit_commercial_margin_lc,
        unit_icmt_lc,
        unit_icmt_eur,
        net_sales_lc,
        net_sales_eur,
        quantity * unit_commercial_margin_eur as commercial_margin_eur,
        quantity * unit_commercial_margin_lc as commercial_margin_lc
    from sales_plan

)

select * from final
where delivered_internal_external = 'External'
