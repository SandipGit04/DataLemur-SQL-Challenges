-- Problem Statement: Reactivated Users | Company: Facebook
SELECT 
  EXTRACT(MONTH FROM ul1.login_date) AS mth,
  COUNT(DISTINCT ul1.user_id) AS reactivated_users
FROM user_logins AS ul1
WHERE NOT EXISTS
    ( SELECT *
      FROM user_logins AS ul2
      WHERE ul1.user_id = ul2.user_id
      AND EXTRACT(MONTH FROM ul2.login_date) = 
          EXTRACT(MONTH FROM ul1.login_date - '1 month' :: INTERVAL )
    )
GROUP BY EXTRACT(MONTH FROM ul1.login_date)
ORDER BY mth;
