-- Problem Statement: Best-Selling Product | Company: Amazon
WITH CTE_HIGH_SALES AS (
  SELECT 
    RANK() OVER(PARTITION BY category_name ORDER BY sales_quantity DESC, rating DESC) as rank,
    category_name,
    product_name,
    sales_quantity,
    rating
  FROM products AS p
  INNER JOIN product_sales AS ps
  ON p.product_id	= ps.product_id
)

SELECT
  category_name,
  product_name
FROM CTE_HIGH_SALES
WHERE rank = 1
ORDER BY category_name;
