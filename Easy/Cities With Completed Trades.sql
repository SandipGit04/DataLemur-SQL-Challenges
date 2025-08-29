-- Problem Statement: Cities With Completed Trades | Company: Robinhood
SELECT 
  u.city AS city,
  COUNT(u.user_id) AS total_orders
FROM trades AS t
JOIN users AS u
ON t.user_id = u.user_id AND t.status = 'Completed'
GROUP BY u.city
ORDER BY total_orders DESC
LIMIT 3;
