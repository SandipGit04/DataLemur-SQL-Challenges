-- Problem Statement: Sending vs. Opening Snaps | Company: Snapchat
SELECT 
  ab.age_bucket,
  ROUND(SUM(CASE WHEN av.activity_type = 'send' THEN av.time_spent ELSE 0 END) / SUM(av.time_spent) * 100 , 2) AS send_perc,
  ROUND(SUM(CASE WHEN av.activity_type = 'open' THEN av.time_spent ELSE 0 END) / SUM(av.time_spent) * 100 , 2) AS open_perc
FROM age_breakdown AS ab
JOIN activities AS av
ON ab.user_id = av.user_id
WHERE activity_type IN ('open' , 'send')
GROUP BY ab.age_bucket
ORDER BY ab.age_bucket DESC;
