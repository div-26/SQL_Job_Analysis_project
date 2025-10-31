/* 
Question: What are the top paying skills for Data Analyst jobs?
- Why? It highlights the skills that command the highest salaries in Data Analyst positions, providing insights into the financial value of specific skills in the job market.
*/

SELECT
    skills,
    ROUND(AVG(salary_year_avg), 0) AS average_salary
FROM
    job_postings_fact
INNER JOIN skills_job_dim ON
    job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON
    skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_postings_fact.job_title_short = 'Data Analyst' AND
    job_postings_fact.salary_year_avg IS NOT NULL
GROUP BY
    skills
ORDER BY
    average_salary DESC
LIMIT 25;

-- This query retrieves the top 25 skills for Data Analyst jobs based on the average yearly salary associated with each skill.
