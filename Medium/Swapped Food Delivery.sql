-- Problem Statement: Swapped Food Delivery | Company: Zomato
SELECT 
  order_id,
  CASE 
    WHEN (order_id % 2) = 0 THEN LAG(item) OVER()
    WHEN (order_id % 2) <> 0 AND order_id = (SELECT MAX(order_id) FROM orders) THEN item
    ELSE LEAD(item) OVER()
  END AS correct
FROM orders;
