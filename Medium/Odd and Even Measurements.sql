-- Problem Statement: Odd and Even Measurements | Company: Google 
WITH CTE_MESURMENTS AS
(
  SELECT 
    ROW_NUMBER() OVER(PARTITION BY measurement_time::DATE ORDER by measurement_time) as rank,
    measurement_time::DATE AS measurement_day,
    measurement_value
  FROM measurements
)

SELECT 
  measurement_day,
  SUM(CASE WHEN rank % 2 != 0 THEN measurement_value ELSE 0 END) AS odd_sum,
  SUM(CASE WHEN rank % 2 = 0 THEN measurement_value ELSE 0 END) AS even_sum
FROM CTE_MESURMENTS
GROUP BY measurement_day
ORDER BY measurement_day;
