-- Problem Statement: Highest-Grossing Items | Company: Amazon
WITH CTE AS 
  (
    SELECT
      category,
      product,
      ROUND(SUM(spend), 2) AS total_spend,
      DENSE_RANK() OVER(PARTITION BY category ORDER BY SUM(spend) DESC) AS ranking
    FROM product_spend
    WHERE YEAR(transaction_date) = 2022
    GROUP BY category, product
  )
  
SELECT 
  category,
  product,
  total_spend
FROM CTE
WHERE ranking < 3
