-- Problem Statement: FAANG Stock Min-Max (Part 1) (Solution 2) | Company: Bloomberg
SELECT 
  DISTINCT ticker,
  FIRST_VALUE(TO_CHAR(date, 'Mon-YYYY')) OVER(PARTITION BY ticker ORDER BY open DESC) AS highest_mth,
  MAX(open) OVER(PARTITION BY ticker ORDER BY open DESC) AS highest_open,
  LAST_VALUE(TO_CHAR(date, 'Mon-YYYY')) OVER(PARTITION BY ticker ORDER BY open DESC ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS lowest_mth, 
  MIN(open) OVER(PARTITION BY ticker ORDER BY open) AS lowest_open
FROM stock_prices
ORDER BY ticker;
