SELECT AVG(total_assistance_duration) AS average_assistance_duration
FROM (
  SELECT SUM(completed_at - started_at) as total_assistance_duration
  FROM assistance_requests 
  JOIN students ON students.id = assistance_requests.student_id
  JOIN cohorts ON cohorts.id = cohort_id
  GROUP BY cohorts.name
) AS total;