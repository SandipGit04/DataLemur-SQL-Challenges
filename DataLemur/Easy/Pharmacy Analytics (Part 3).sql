-- Problem Statement: Pharmacy Analytics (Part 3) | Company: CVS Health
SELECT 
  manufacturer,
  CONCAT('$', ROUND((SUM(total_sales) / 1000000.0), 0), ' million') AS total_sale
FROM pharmacy_sales
GROUP BY manufacturer
ORDER BY SUM(total_sales) DESC; -- manufacturer ASC;
