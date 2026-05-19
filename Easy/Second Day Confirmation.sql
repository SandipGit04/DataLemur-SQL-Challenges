-- Problem Statement: Second Day Confirmation | Company: TikTok
SELECT user_id
FROM emails AS e
JOIN texts AS t 
ON e.email_id = t.email_id
WHERE signup_action = 'Confirmed' AND (signup_date + INTERVAL '1 days') = action_date;
