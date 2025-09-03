-- Problem Statement: User's Third Transaction | Company: Uber
SELECT
  user_id,
  spend,
  transaction_date
FROM
    (
      SELECT 
        DENSE_RANK() OVER(PARTITION BY user_id ORDER BY transaction_date) AS rank,
        *
      FROM transactions
    ) AS Rank_Table
WHERE rank = 3
