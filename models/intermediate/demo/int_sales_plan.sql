with sales_plan as (

    select * from {{ ref('stg_sales_plan') }}

),

customers as (

    select * from {{ ref('stg_dim_customer') }}

),

final as (

    select
        sales_plan.fiscal_year,
        sales_plan.fiscal_period,
        sales_plan.calendar_date,
        sales_plan.company_id,
        sales_plan.sales_organization_id,
        sales_plan.business_unit,
        sales_plan.bu_currency,
        sales_plan.profit_center_id,
        sales_plan.contract_id,
        sales_plan.item_id,
        sales_plan.billing_local_currency,
        sales_plan.local_currency,
        sales_plan.delivered_customer_id,
        sales_plan.delivered_internal_external,
        sales_plan.invoiced_customer_id,
        sales_plan.invoiced_internal_external,
        sales_plan.hedging_rate,
        sales_plan.contract_yield,
        sales_plan.contract_status,
        sales_plan.lta_or_spot,
        sales_plan.incoterms_code,
        sales_plan.activity,
        sales_plan.product_type,
        sales_plan.material_group_name,
        sales_plan.specificity,
        sales_plan.scenario,
        sales_plan.quantity,
        sales_plan.unit_selling_expenses_amount_lc,
        sales_plan.unit_selling_expenses_amount_eur,
        sales_plan.unit_logistic_costs_amount_lc,
        sales_plan.unit_logistic_costs_amount_eur,
        sales_plan.unit_structured_products_amount_lc,
        sales_plan.unit_structured_products_amount_eur,
        sales_plan.unit_raw_materials_cost_amount_lc,
        sales_plan.unit_raw_materials_cost_amount_eur,
        sales_plan.unit_commercial_margin_eur,
        sales_plan.unit_commercial_margin_lc,
        sales_plan.unit_icmt_lc,
        sales_plan.unit_icmt_eur,
        sales_plan.net_sales_lc,
        sales_plan.net_sales_eur,
        sales_plan.quantity * sales_plan.unit_commercial_margin_eur as commercial_margin_eur,
        sales_plan.quantity * sales_plan.unit_commercial_margin_lc as commercial_margin_lc
    from sales_plan
    left join customers
        on sales_plan.delivered_customer_id = customers.customer_id

)

select * from final
where delivered_internal_external = 'External'
