WITH top_paying_jobs AS (
    SELECT 
        job_id,
        job_title,
        salary_year_avg,
        name AS Company_Name
    FROM
        job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE
        (job_title_short = 'Data Analyst' OR job_title_short = 'Data Engineer') AND
        job_country = 'Sri Lanka' AND
        salary_year_avg IS NOT NULL 
    ORDER BY
        salary_year_avg DESC
    LIMIT 10 
)
SELECT
    top_paying_jobs.*,
    skills
FROM
    top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    salary_year_avg DESC


/* 
SQL is the most common skill — it's essential for working with data in any role.
Power BI and Azure are highly requested — companies want people who can visualize data and work on cloud platforms.
Python is popular — it’s used for automation, analysis, and machine learning.
Databricks shows up — pointing to the trend in big data and scalable analytics tools.
Many skills are Microsoft ecosystem tools like Power BI, Azure, and SSIS — suggesting companies are invested in Microsoft platforms.
The demand is strong for ETL (Extract, Transform, Load) and BI (Business Intelligence) skills — which are key in automation and dashboarding.

[
  {
    "job_id": 45828,
    "job_title": "BI Data Architect",
    "salary_year_avg": "163782.0",
    "company_name": "IFS",
    "skills": "sql"
  },
  {
    "job_id": 45828,
    "job_title": "BI Data Architect",
    "salary_year_avg": "163782.0",
    "company_name": "IFS",
    "skills": "azure"
  },
  {
    "job_id": 45828,
    "job_title": "BI Data Architect",
    "salary_year_avg": "163782.0",
    "company_name": "IFS",
    "skills": "oracle"
  },
  {
    "job_id": 45828,
    "job_title": "BI Data Architect",
    "salary_year_avg": "163782.0",
    "company_name": "IFS",
    "skills": "power bi"
  },
  {
    "job_id": 45828,
    "job_title": "BI Data Architect",
    "salary_year_avg": "163782.0",
    "company_name": "IFS",
    "skills": "ssis"
  },
  {
    "job_id": 986386,
    "job_title": "Data Engineer (Microsoft)",
    "salary_year_avg": "133000.0",
    "company_name": "IFS",
    "skills": "azure"
  },
  {
    "job_id": 986386,
    "job_title": "Data Engineer (Microsoft)",
    "salary_year_avg": "133000.0",
    "company_name": "IFS",
    "skills": "power bi"
  },
  {
    "job_id": 97683,
    "job_title": "Billing / Data Analyst",
    "salary_year_avg": "98500.0",
    "company_name": "Inivos",
    "skills": "sql"
  },
  {
    "job_id": 97683,
    "job_title": "Billing / Data Analyst",
    "salary_year_avg": "98500.0",
    "company_name": "Inivos",
    "skills": "excel"
  },
  {
    "job_id": 1483086,
    "job_title": "Technical Lead - Data engineer (Azure)",
    "salary_year_avg": "96773.0",
    "company_name": "Swivel Group",
    "skills": "sql"
  },
  {
    "job_id": 1483086,
    "job_title": "Technical Lead - Data engineer (Azure)",
    "salary_year_avg": "96773.0",
    "company_name": "Swivel Group",
    "skills": "python"
  },
  {
    "job_id": 1483086,
    "job_title": "Technical Lead - Data engineer (Azure)",
    "salary_year_avg": "96773.0",
    "company_name": "Swivel Group",
    "skills": "java"
  },
  {
    "job_id": 1483086,
    "job_title": "Technical Lead - Data engineer (Azure)",
    "salary_year_avg": "96773.0",
    "company_name": "Swivel Group",
    "skills": "azure"
  },
  {
    "job_id": 1483086,
    "job_title": "Technical Lead - Data engineer (Azure)",
    "salary_year_avg": "96773.0",
    "company_name": "Swivel Group",
    "skills": "databricks"
  },
  {
    "job_id": 1483086,
    "job_title": "Technical Lead - Data engineer (Azure)",
    "salary_year_avg": "96773.0",
    "company_name": "Swivel Group",
    "skills": "spark"
  },
  {
    "job_id": 1483086,
    "job_title": "Technical Lead - Data engineer (Azure)",
    "salary_year_avg": "96773.0",
    "company_name": "Swivel Group",
    "skills": "pyspark"
  },
  {
    "job_id": 294496,
    "job_title": "Data Engineer",
    "salary_year_avg": "96773.0",
    "company_name": "Gapstars",
    "skills": "sql"
  },
  {
    "job_id": 294496,
    "job_title": "Data Engineer",
    "salary_year_avg": "96773.0",
    "company_name": "Gapstars",
    "skills": "python"
  },
  {
    "job_id": 294496,
    "job_title": "Data Engineer",
    "salary_year_avg": "96773.0",
    "company_name": "Gapstars",
    "skills": "bigquery"
  },
  {
    "job_id": 294496,
    "job_title": "Data Engineer",
    "salary_year_avg": "96773.0",
    "company_name": "Gapstars",
    "skills": "redshift"
  },
  {
    "job_id": 294496,
    "job_title": "Data Engineer",
    "salary_year_avg": "96773.0",
    "company_name": "Gapstars",
    "skills": "gcp"
  },
  {
    "job_id": 294496,
    "job_title": "Data Engineer",
    "salary_year_avg": "96773.0",
    "company_name": "Gapstars",
    "skills": "tableau"
  },
  {
    "job_id": 294496,
    "job_title": "Data Engineer",
    "salary_year_avg": "96773.0",
    "company_name": "Gapstars",
    "skills": "docker"
  },
  {
    "job_id": 294496,
    "job_title": "Data Engineer",
    "salary_year_avg": "96773.0",
    "company_name": "Gapstars",
    "skills": "unity"
  },
  {
    "job_id": 767983,
    "job_title": "Data Engineer",
    "salary_year_avg": "96773.0",
    "company_name": "Inivos",
    "skills": "databricks"
  },
  {
    "job_id": 767983,
    "job_title": "Data Engineer",
    "salary_year_avg": "96773.0",
    "company_name": "Inivos",
    "skills": "power bi"
  },
  {
    "job_id": 997438,
    "job_title": "Power BI Data Analyst - R&D Labs",
    "salary_year_avg": "48598.5",
    "company_name": "IFS",
    "skills": "power bi"
  },
  {
    "job_id": 997438,
    "job_title": "Power BI Data Analyst - R&D Labs",
    "salary_year_avg": "48598.5",
    "company_name": "IFS",
    "skills": "dax"
  },
  {
    "job_id": 510589,
    "job_title": "User Insights Data Analyst - R&D User Experience Team",
    "salary_year_avg": "45000.0",
    "company_name": "IFS",
    "skills": "sql"
  },
  {
    "job_id": 510589,
    "job_title": "User Insights Data Analyst - R&D User Experience Team",
    "salary_year_avg": "45000.0",
    "company_name": "IFS",
    "skills": "python"
  },
  {
    "job_id": 510589,
    "job_title": "User Insights Data Analyst - R&D User Experience Team",
    "salary_year_avg": "45000.0",
    "company_name": "IFS",
    "skills": "r"
  },
  {
    "job_id": 510589,
    "job_title": "User Insights Data Analyst - R&D User Experience Team",
    "salary_year_avg": "45000.0",
    "company_name": "IFS",
    "skills": "azure"
  },
  {
    "job_id": 510589,
    "job_title": "User Insights Data Analyst - R&D User Experience Team",
    "salary_year_avg": "45000.0",
    "company_name": "IFS",
    "skills": "hadoop"
  },
  {
    "job_id": 510589,
    "job_title": "User Insights Data Analyst - R&D User Experience Team",
    "salary_year_avg": "45000.0",
    "company_name": "IFS",
    "skills": "tableau"
  }
]
 */ 