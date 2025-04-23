# Introduction
This project provides a comprehensive analysis of data analyst/Engineer roles in Sri Lanka and around the world, focusing on top-paying positions, high-demand skills, and the intersection where skill demand aligns with higher salaries. Using real-world job posting data and structured SQL queries (available in the [project_sql folder](/project_sql/)), the study offers valuable insights into current trends shaping the data analytics job market.

### The questions I wanted to answer through my SQL queries were:
- What are the top-paying data analyst/engineer jobs?
- What skills are required for these top-paying jobs?
- What skills are most in demand for data analysts?
- Which skills are associated with higher salaries?
- What are the most optimal skills to learn?

## Tools and Technologies Used

- **SQL** was used as the core tool for querying the database and extracting key insights from the job posting data.

- **PostgreSQL** served as the database management system, suitable for handling and managing structured data efficiently.

- **Visual Studio Code** was used to write and execute SQL queries, providing a streamlined environment for development.

- **Git** and **GitHub** were used for version control and collaboration, enabling effective tracking and sharing of SQL scripts and project progress.

## Analysis

### 1. Top Paying Data Analyst/Engineer Jobs?
This analysis highlights the top-paying Data Analyst and Data Engineer jobs in Sri Lanka. It shows which roles offer the highest salaries, where they’re located, and what types of positions are most common.

``` sql
SELECT 
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
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
LIMIT 10;
````
Here are insights from the top-paying Data Analyst/Engineer jobs in Sri Lanka:

- BI Data Architect roles offer the highest salaries, showing strong demand for advanced business intelligence expertise.

- Data Engineers, especially those with Microsoft or Azure experience, appear frequently in high-paying positions.

- All roles are based in Colombo and are full-time, reflecting that most top-tier data jobs are centralized in the area.