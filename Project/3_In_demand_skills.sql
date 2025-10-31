/* Question: What are the most in demand skills for Data Analyst jobs?
 - Why? Retrieves the top 5 skills with the highest demand in job market for Data Analysts, providing insights into skill requirements and trends */

SELECT 
    skills_dim.skills AS skill_name,
    COUNT(skills_job_dim.job_id) AS jobs_available
FROM 
    skills_dim

INNER JOIN skills_job_dim ON
    skills_dim.skill_id = skills_job_dim.skill_id
INNER JOIN job_postings_fact ON
    skills_job_dim.job_id = job_postings_fact.job_id

WHERE 
    job_postings_fact.job_title_short = 'Data Analyst'

GROUP BY 
    skills_dim.skills

ORDER BY 
    jobs_available DESC

LIMIT 5;

/* Insights from the query:
     - SQL is the mos in-demand skill with roughly 92.5k jobs available
     - Excel is the second most in-demand skill with around 67k jobs available
     - Python follows with approximately 57k jobs available
     - Tableau and Power BI are also significant, with around 46k and 39k jobs available respectively.
    Note: The numbers cited above are approximate and apply only to the Data Analyst job market. */