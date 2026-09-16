-- Problem Statement: Y-on-Y Growth Rate | Company: Wayfair
WITH CTE_USER_TRANC AS
(
  SELECT 
    EXTRACT(YEAR FROM transaction_date) AS year,
    product_id,
    spend AS curr_year_spend,
    LAG(spend) OVER(PARTITION BY product_id ORDER BY transaction_date) AS prev_year_spend
  FROM user_transactions
)

SELECT *,
  ROUND((curr_year_spend - prev_year_spend) / prev_year_spend * 100 , 2) AS yoy_rate
FROM CTE_USER_TRANC;
