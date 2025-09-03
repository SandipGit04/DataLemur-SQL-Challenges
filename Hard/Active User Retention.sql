-- Problem Statement: Second Highest Salary | Company: Facebook
WITH CTE AS
  (
    SELECT 
      user_id,
      DATE_PART('month', event_date) AS prev_month,
      LEAD(DATE_PART('month', event_date)) 
      OVER(PARTITION BY user_id ORDER BY event_date) AS curr_month
    FROM user_actions
    WHERE DATE_PART('year', event_date) = 2022
  )

SELECT 
  curr_month AS month,
  COUNT(user_id) AS monthly_active_users
FROM CTE 
WHERE prev_month != curr_month AND curr_month = 7
GROUP BY curr_month
