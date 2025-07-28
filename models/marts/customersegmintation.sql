with customer_sales AS(
    select 
    s.customer_id,
    SUM(S.quantity_sold) AS total_purchases,
    SUM(s.total_amount) AS total_spend,
 from {{ref("stg_retail__fact_sales")}} s,
 group by s.customer_id 
    

)

select 
cs.customer_id,
cs.total_purchases,
cs.total_spend,
CASE
    WHEN cs.total_purchases >= 50 THEN 'high_value'
    WHEN cs.total_purchases BETWEEN 20 AND 49 THEN 'medium_value'
    WHEN cs.total_purchases <= 20 THEN 'low_value'
    ELSE 'unknown'
END AS customer_segment
FROM customer_sales cs