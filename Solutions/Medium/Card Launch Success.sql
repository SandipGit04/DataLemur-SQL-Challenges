-- Problem Statement: Card Launch Success | Company: JPMorgan
SELECT
  card_name,
  issued_amount
FROM 
  (
    SELECT 
      ROW_NUMBER() OVER(PARTITION BY card_name ORDER BY issue_year, issue_month) AS rank,
      card_name,
      issued_amount
    FROM monthly_cards_issued
  ) AS issued_time
WHERE rank = 1
ORDER BY issued_amount DESC;
