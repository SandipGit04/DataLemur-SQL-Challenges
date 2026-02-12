-- Problem Statement: IBM db2 Product Analytics | Company: IBM
WITH Unique_Query_CTE AS 
  (
      SELECT 
        e.employee_id AS employee_id,
        COALESCE(COUNT(DISTINCT q.query_id), 0) AS unique_queries
      FROM queries AS q
      RIGHT JOIN employees AS e
      ON q.employee_id = e.employee_id
      AND q.query_starttime >= '07/01/2023 00:00:00' 
      AND q.query_starttime < '10/01/2023 00:00:00'
      GROUP BY e.employee_id
  )

SELECT 
  unique_queries,
  COUNT(employee_id) AS employee_count
FROM Unique_Query_CTE
GROUP BY unique_queries
ORDER BY unique_queries
