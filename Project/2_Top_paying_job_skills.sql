/* Question: What skills are required for top paying Data Analyst jobs?
 - Why? It highlights the skills that are in demand for high-paying Data Analyst positions, providing insights into employability and skill development */

WITH top_paying_jobs AS (
    SELECT
        job_postings_fact.job_id,
        company_dim.name AS company_name,
        job_title,
        salary_year_avg
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

    LIMIT 10
)
SELECT 
    top_paying_jobs.*,
    skills_dim.skills AS required_skills
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY 
    top_paying_jobs.salary_year_avg DESC; -- Retrieves top 10 highest paying remote Data Analyst jobs and their required skills using a CTE and joins.

/* Here's a summary of the insights from the query:
   - SQL is leading with a bold count of 8 jobs, indicating its high demand.
   - Python follows closely with 7 jobs, showcasing its importance in data analysis.
   - Tableau and Power BI are also significant, with 6 jobs each, highlighting their relevance in data visualization.
   - R and Excel are also significant, with 5 and 4 jobs respectively. */