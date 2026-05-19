-- Problem Statement: Average Post Hiatus (Part 1) | Company: Facebook
SELECT 
  user_id,
  DATEDIFF(MAX(post_date) , MIN(post_date)) AS days_between
FROM posts
WHERE YEAR(post_date) = 2021
GROUP BY user_id
HAVING MAX(post_date) != MIN(post_date)
ORDER BY days_between DESC;
