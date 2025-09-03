-- Problem Statement: Duplicate Job Listings | Company: LinkedIn
SELECT COUNT(company_id) AS duplicate_companies
FROM
    (
      SELECT 
        company_id
      FROM job_listings
      GROUP BY company_id, title
      HAVING COUNT(title) > 1
    ) AS Companies
