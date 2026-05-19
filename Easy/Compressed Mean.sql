-- Problem Statement: Compressed Mean | Company: Alibaba
SELECT 
  ROUND((SUM(item_count * order_occurrences)::DECIMAL / SUM(order_occurrences)) , 1) AS mean
FROM items_per_order;
