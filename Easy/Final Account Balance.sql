-- Problem Statement: Final Account Balance | Company: PayPal
SELECT 
  account_id,
  SUM(CASE WHEN transaction_type = 'Deposit' THEN amount ELSE 0 END) - 
  SUM(CASE WHEN transaction_type = 'Withdrawal' THEN amount ELSE 0 END)
FROM transactions
GROUP BY account_id;
