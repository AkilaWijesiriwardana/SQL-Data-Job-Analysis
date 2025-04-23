WITH demand_skills AS (  --CTE 1
    SELECT 
        skills_dim.skill_id,
        skills_dim.skills,
        COUNT(skills_job_dim.job_id) AS Demand_Count
    FROM
        job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        /*job_title_short = 'Data Analyst' AND
        salary_year_avg IS NOT NULL AND
        job_country = 'Sri Lanka'*/
        job_title_short = 'Data Analyst' AND
        salary_year_avg IS NOT NULL AND
        job_work_from_home = 'True'
    GROUP BY
        skills_dim.skill_id

), Salary AS (  --CTE 2
    SELECT
        skills_dim.skill_id,
        skills_dim.skills,
        ROUND(AVG(salary_year_avg),2) AS Average_Salary
    FROM
        job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        /*job_title_short = 'Data Analyst' AND
        salary_year_avg IS NOT NULL AND
        job_country = 'Sri Lanka'*/
        job_title_short = 'Data Analyst' AND
        salary_year_avg IS NOT NULL AND
        job_work_from_home = 'True'
    GROUP BY 
        skills_dim.skill_id
)

SELECT 
    demand_skills.skill_id,
    demand_skills.skills,
    demand_skills.Demand_Count,
    Salary.Average_Salary
FROM
    demand_skills
INNER JOIN Salary ON demand_skills.skill_id = Salary.skill_id
WHERE
    demand_skills.Demand_Count > 10
ORDER BY
    Average_Salary DESC,
    Demand_Count DESC
LIMIT 25;



-- Rewriting the query more concisely

SELECT
    skills_dim.skill_id,
    skills_dim.skills,
    COUNT(skills_job_dim.job_id) AS Demand_Count,
    ROUND(AVG(job_postings_fact.salary_year_avg), 2) AS Average_Salary
FROM 
    job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    /*job_title_short = 'Data Analyst' AND
     salary_year_avg IS NOT NULL AND
    job_country = 'Sri Lanka'*/
    job_title_short = 'Data Analyst' AND
    salary_year_avg IS NOT NULL AND
    job_work_from_home = 'True'
GROUP BY    
    skills_dim.skill_id
HAVING
    COUNT(skills_job_dim.job_id) > 10
ORDER BY
    Average_Salary DESC,
    Demand_Count DESC
LIMIT 25;
    