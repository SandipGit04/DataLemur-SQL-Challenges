-- Problem Statement: Supercloud Customer | Company: Microsoft
WITH SUPERCLOUD_CTE AS
  (
    SELECT 
      customer_id,
      COUNT(DISTINCT p.product_category) AS total_products
    FROM customer_contracts AS cc
    JOIN products AS p
    ON p.product_id = cc.product_id
    GROUP BY cc.customer_id
)

SELECT customer_id
FROM SUPERCLOUD_CTE
WHERE total_products = (SELECT MAX(total_products) FROM SUPERCLOUD_CTE)
