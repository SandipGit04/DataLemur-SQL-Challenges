-- Problem Statement: APatient Support Analysis (Part 1) | Company: UnitedHealth
SELECT COUNT(policy_holder_id) AS policy_holder_count
FROM
(
  SELECT policy_holder_id
  FROM callers
  GROUP BY policy_holder_id
  HAVING COUNT(case_id) > 2
) AS call_records;
