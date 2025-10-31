/*
Question: Find the optimal skills for Data Analyst jobs, based on high demand and high salaries.
- Why? It identifies skills that are both in high demand and command high salaries, providing insights into the most valuable skills for Data Analysts in the job market.
*/

WITH top_demanded_skills AS (
    SELECT 
        skills_dim.skill_id,
        skills_dim.skills AS skill_name,
        COUNT(skills_job_dim.job_id) AS jobs_available
    FROM 
        skills_dim

    INNER JOIN skills_job_dim ON
        skills_dim.skill_id = skills_job_dim.skill_id
    INNER JOIN job_postings_fact ON
        skills_job_dim.job_id = job_postings_fact.job_id

    WHERE 
        job_postings_fact.job_title_short = 'Data Analyst' AND
        job_postings_fact.salary_year_avg IS NOT NULL

    GROUP BY 
        skills_dim.skill_id
), top_paying_skills AS (
    SELECT
        skills_dim.skill_id,
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
        skills_dim.skill_id 
)

SELECT
    top_demanded_skills.skill_id,
    top_demanded_skills.skill_name,
    jobs_available,
    average_salary
FROM 
    top_demanded_skills
INNER JOIN top_paying_skills ON
    top_demanded_skills.skill_id = top_paying_skills.skill_id
WHERE
    jobs_available > 10
ORDER BY
    jobs_available DESC,
    average_salary DESC
LIMIT 30;

-- This query retrieves the optimal skills for Data Analyst jobs by combining the most in-demand skills with those that command high salaries.
-- It provides insights into the skills that are both sought after in the job market and financially rewarding.
