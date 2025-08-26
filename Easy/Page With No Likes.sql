-- Company: Facebook
SELECT p.page_id
FROM pages AS p
LEFT JOIN page_likes AS pl
ON p.page_id = pl.page_id
GROUP BY p.page_id
HAVING COUNT(pl.page_id) = 0;
