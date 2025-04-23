SELECT
    skills,
    ROUND(AVG(salary_year_avg),2) AS Average_Salary
FROM
    job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' AND
    salary_year_avg IS NOT NULL AND
    job_country = 'Sri Lanka'
    /*  job_title_short = 'Data Analyst' AND
        salary_year_avg IS NOT NULL AND
        job_work_from_home = 'True'*/
GROUP BY 
    skills
ORDER BY
    Average_Salary DESC
LIMIT 25;

/* 
Excel and SQL are the top-paying skills, showing their strong demand in the Sri Lankan data job market.

Business intelligence tools like Power BI, DAX, and Tableau also offer competitive salaries, highlighting their growing use in data-driven roles.

Programming and big data tools like Python, R, Hadoop, and Azure are emerging but currently offer moderate pay compared to core analytical tools.

[
  {
    "skills": "excel",
    "average_salary": "98500.00"
  },
  {
    "skills": "sql",
    "average_salary": "71750.00"
  },
  {
    "skills": "dax",
    "average_salary": "48598.50"
  },
  {
    "skills": "power bi",
    "average_salary": "48598.50"
  },
  {
    "skills": "azure",
    "average_salary": "45000.00"
  },
  {
    "skills": "tableau",
    "average_salary": "45000.00"
  },
  {
    "skills": "hadoop",
    "average_salary": "45000.00"
  },
  {
    "skills": "python",
    "average_salary": "45000.00"
  },
  {
    "skills": "r",
    "average_salary": "45000.00"
  }
]
*/