-- Problem Statement: Advertiser Status | Company: Facebook
SELECT
  COALESCE(a.user_id, d.user_id) AS user_id,
  CASE 
    WHEN paid IS NULL THEN 'CHURN'
    WHEN paid IS NOT NULL AND status IN ('NEW', 'EXISTING', 'RESURRECT') THEN 'EXISTING'
    WHEN status = 'CHURN' AND paid IS NOT NULL THEN 'RESURRECT'
    ELSE 'NEW'
  END new_status
FROM advertiser AS a
FULL OUTER JOIN daily_pay AS d
ON a.user_id = d.user_id
ORDER BY user_id, new_status;
