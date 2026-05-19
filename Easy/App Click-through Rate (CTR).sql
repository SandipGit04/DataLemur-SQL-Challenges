-- Problem Statement: App Click-through Rate (CTR) | Company: Facebook
SELECT 
  app_id,
  ROUND((100.0 * SUM(CASE WHEN event_type = 'click' THEN 1.0 ELSE 0 END)) / 
  SUM(CASE WHEN event_type = 'impression' THEN 1.0 ELSE 0 END) , 2) AS ctr
FROM events
WHERE DATE_PART('year', timestamp) = 2022
GROUP BY app_id;
