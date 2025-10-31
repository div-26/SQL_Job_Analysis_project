/* Question: What are the top paying data analyst jobs?
 - Why? It highlights the top paying Data Analyst roles, offering insights about employability of Data Analysts */

SELECT
    job_id,
    company_dim.name AS company_name,
    job_title,
    salary_year_avg,
    job_location,
    job_schedule_type,
    job_posted_date

From 
    job_postings_fact

LEFT JOIN company_dim ON
    job_postings_fact.company_id = company_dim.company_id

WHERE
    job_title_short = 'Data Analyst'
    AND job_location = 'Anywhere'
    AND salary_year_avg IS NOT NULL

ORDER BY
    salary_year_avg DESC

LIMIT 10;

-- This query retrieves the top 10 highest paying Data Analyst jobs that are available remotely,
-- ensuring that the salary information is not null and the job title matches 'Data Analyst'.
-- The results are ordered by the average yearly salary in descending order to highlight the top paying positions