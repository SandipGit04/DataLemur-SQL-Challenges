-- Problem Statement: Histogram of Tweets | Company: Twitter
SELECT
  COUNT(user_id) AS tweet_bucket,
  users_num
FROM 
    (
      SELECT 
        user_id,
        COUNT(user_id) AS users_num
      FROM tweets
      WHERE YEAR(tweet_date) = 2022
      GROUP BY user_id
    ) AS Total_Users
GROUP BY users_num
ORDER BY tweet_bucket
