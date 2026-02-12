-- Problem Statement: Signup Activation Rate | Company: TikTok
SELECT 
  ROUND((SUM(CASE WHEN t.signup_action = 'Confirmed' THEN 1.0 ELSE 0 END) / 
         COUNT(DISTINCT e.email_id)), 2) AS confirm_rate
FROM emails AS e
LEFT JOIN texts AS t
ON e.email_id = t.email_id; 
