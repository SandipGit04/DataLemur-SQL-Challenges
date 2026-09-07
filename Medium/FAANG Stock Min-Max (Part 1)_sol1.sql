-- Problem Statement: FAANG Stock Min-Max (Part 1) (Solution 1) | Company: Bloomberg
WITH CTE_OPEN AS (
  SELECT 
    ticker,
    MAX(open) AS max_open,
    MIN(open) AS min_open
  FROM stock_prices
  GROUP BY ticker
)
, CTE_HIGH AS (
  SELECT 
    ticker,
    TO_CHAR(date, 'Mon-YYYY') AS highest_mth,
    open as highest_open
  FROM stock_prices
  WHERE open IN (SELECT max_open FROM CTE_OPEN)
)
, CTE_LOW AS (
  SELECT 
    ticker,
    TO_CHAR(date, 'Mon-YYYY') AS lowest_mth,
    open as lowest_open
  FROM stock_prices
  WHERE open IN (SELECT min_open FROM CTE_OPEN)
)

SELECT 
  h.ticker,
  h.highest_mth,
  h.highest_open,
  l.lowest_mth,
  l.lowest_open
FROM CTE_HIGH as h
JOIN CTE_LOW AS l
ON h.ticker = l.ticker
ORDER BY h.ticker;
