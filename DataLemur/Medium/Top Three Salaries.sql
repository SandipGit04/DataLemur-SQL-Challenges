-- Problem Statement: Top Three Salaries | Company: FAANG
WITH CTE_TOP_EARNERS AS
(
  SELECT 
    DENSE_RANK() OVER(PARTITION BY d.department_name ORDER BY d.department_name ASC, e.salary DESC) AS rank,
    d.department_name,
    e.name,
    e.salary
  FROM employee AS e
  JOIN department AS d
  ON e.department_id = d.department_id
)

SELECT
  department_name,
  name,
  salary
FROM CTE_TOP_EARNERS
WHERE rank <= 3
ORDER BY department_name ASC, salary DESC, name ASC
