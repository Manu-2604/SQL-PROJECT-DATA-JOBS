/*  QUESTION 2: What skills are required for the top-paying Data Analyst jobs?
   - Use the top 10 highest-paying Data Analyst jobs from first query.
   - Add the specific skills required for these roles.
   - Why? It provides a detailed look at which high-paying jobs demand certain skills,
     helping job seekers understand which skills to develop that align with top salaries.
*/

WITH top_paying_jobs AS (
    
    SELECT job_id,
            job_title_short,
            job_location,
            salary_year_avg,
            job_posted_date,
            company_dim.name AS company_name
    FROM job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE job_title_short = 'Data Analyst' AND 
            job_location = 'Anywhere' AND
            salary_year_avg IS NOT NULL
    ORDER BY salary_year_avg DESC
    LIMIT 10
) 

SELECT top_paying_jobs.*,
       skills_dim.skills AS skill_name
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY salary_year_avg DESC;

/*  KEY INSIGHTS:
    The highest-paying Data Analyst positions in your dataset consistently combine three core competencies:

    -Data querying: SQL
    -Programming & analysis: Python (and sometimes R)
    -Data visualization: Tableau (with some Power BI)

    -Beyond those, cloud technologies (Snowflake, AWS, Azure) and collaboration tools (Jira, Confluence, Bitbucket) 
     distinguish many of the highest-paying roles. This suggests that employers value analysts who can work across the 
     full data lifecycle—from extracting data to analyzing it and presenting actionable insights.

  [
    {
      "job_id": 552322,
      "job_title_short": "Data Analyst",
      "job_location": "Anywhere",
      "salary_year_avg": "255829.5",
      "job_posted_date": "2023-06-18 16:03:12",
      "company_name": "AT&T",
      "skill_name": "sql"
    },
    {
      "job_id": 552322,
      "job_title_short": "Data Analyst",
      "job_location": "Anywhere",
      "salary_year_avg": "255829.5",
      "job_posted_date": "2023-06-18 16:03:12",
      "company_name": "AT&T",
      "skill_name": "python"
    },
    {
      "job_id": 552322,
      "job_title_short": "Data Analyst",
      "job_location": "Anywhere",
      "salary_year_avg": "255829.5",
      "job_posted_date": "2023-06-18 16:03:12",
      "company_name": "AT&T",
      "skill_name": "r"
    },
    {
      "job_id": 552322,
      "job_title_short": "Data Analyst",
      "job_location": "Anywhere",
      "salary_year_avg": "255829.5",
      "job_posted_date": "2023-06-18 16:03:12",
      "company_name": "AT&T",
      "skill_name": "azure"
    },
    {
      "job_id": 552322,
      "job_title_short": "Data Analyst",
      "job_location": "Anywhere",
      "salary_year_avg": "255829.5",
      "job_posted_date": "2023-06-18 16:03:12",
      "company_name": "AT&T",
      "skill_name": "databricks"
    },
    {
      "job_id": 552322,
      "job_title_short": "Data Analyst",
      "job_location": "Anywhere",
      "salary_year_avg": "255829.5",
      "job_posted_date": "2023-06-18 16:03:12",
      "company_name": "AT&T",
      "skill_name": "aws"
    },
    {
      "job_id": 552322,
      "job_title_short": "Data Analyst",
      "job_location": "Anywhere",
      "salary_year_avg": "255829.5",
      "job_posted_date": "2023-06-18 16:03:12",
      "company_name": "AT&T",
      "skill_name": "pandas"
    },
    {
      "job_id": 552322,
      "job_title_short": "Data Analyst",
      "job_location": "Anywhere",
      "salary_year_avg": "255829.5",
      "job_posted_date": "2023-06-18 16:03:12",
      "company_name": "AT&T",
      "skill_name": "pyspark"
    },
    {
      "job_id": 552322,
      "job_title_short": "Data Analyst",
      "job_location": "Anywhere",
      "salary_year_avg": "255829.5",
      "job_posted_date": "2023-06-18 16:03:12",
      "company_name": "AT&T",
      "skill_name": "jupyter"
    },
    {
      "job_id": 552322,
      "job_title_short": "Data Analyst",
      "job_location": "Anywhere",
      "salary_year_avg": "255829.5",
      "job_posted_date": "2023-06-18 16:03:12",
      "company_name": "AT&T",
      "skill_name": "excel"
    },
    {
      "job_id": 552322,
      "job_title_short": "Data Analyst",
      "job_location": "Anywhere",
      "salary_year_avg": "255829.5",
      "job_posted_date": "2023-06-18 16:03:12",
      "company_name": "AT&T",
      "skill_name": "tableau"
    },
    {
      "job_id": 552322,
      "job_title_short": "Data Analyst",
      "job_location": "Anywhere",
      "salary_year_avg": "255829.5",
      "job_posted_date": "2023-06-18 16:03:12",
      "company_name": "AT&T",
      "skill_name": "power bi"
    },
    {
      "job_id": 552322,
      "job_title_short": "Data Analyst",
      "job_location": "Anywhere",
      "salary_year_avg": "255829.5",
      "job_posted_date": "2023-06-18 16:03:12",
      "company_name": "AT&T",
      "skill_name": "powerpoint"
    },
    {
      "job_id": 99305,
      "job_title_short": "Data Analyst",
      "job_location": "Anywhere",
      "salary_year_avg": "232423.0",
      "job_posted_date": "2023-12-05 20:00:40",
      "company_name": "Pinterest Job Advertisements",
      "skill_name": "sql"
    },
    {
      "job_id": 99305,
      "job_title_short": "Data Analyst",
      "job_location": "Anywhere",
      "salary_year_avg": "232423.0",
      "job_posted_date": "2023-12-05 20:00:40",
      "company_name": "Pinterest Job Advertisements",
      "skill_name": "python"
    },
    {
      "job_id": 99305,
      "job_title_short": "Data Analyst",
      "job_location": "Anywhere",
      "salary_year_avg": "232423.0",
      "job_posted_date": "2023-12-05 20:00:40",
      "company_name": "Pinterest Job Advertisements",
      "skill_name": "r"
    },
    {
      "job_id": 99305,
      "job_title_short": "Data Analyst",
      "job_location": "Anywhere",
      "salary_year_avg": "232423.0",
      "job_posted_date": "2023-12-05 20:00:40",
      "company_name": "Pinterest Job Advertisements",
      "skill_name": "hadoop"
    },
    {
      "job_id": 99305,
      "job_title_short": "Data Analyst",
      "job_location": "Anywhere",
      "salary_year_avg": "232423.0",
      "job_posted_date": "2023-12-05 20:00:40",
      "company_name": "Pinterest Job Advertisements",
      "skill_name": "tableau"
    },
    {
      "job_id": 1021647,
      "job_title_short": "Data Analyst",
      "job_location": "Anywhere",
      "salary_year_avg": "217000.0",
      "job_posted_date": "2023-01-17 00:17:23",
      "company_name": "Uclahealthcareers",
      "skill_name": "sql"
    },
    {
      "job_id": 1021647,
      "job_title_short": "Data Analyst",
      "job_location": "Anywhere",
      "salary_year_avg": "217000.0",
      "job_posted_date": "2023-01-17 00:17:23",
      "company_name": "Uclahealthcareers",
      "skill_name": "crystal"
    },
    {
      "job_id": 1021647,
      "job_title_short": "Data Analyst",
      "job_location": "Anywhere",
      "salary_year_avg": "217000.0",
      "job_posted_date": "2023-01-17 00:17:23",
      "company_name": "Uclahealthcareers",
      "skill_name": "oracle"
    },
    {
      "job_id": 1021647,
      "job_title_short": "Data Analyst",
      "job_location": "Anywhere",
      "salary_year_avg": "217000.0",
      "job_posted_date": "2023-01-17 00:17:23",
      "company_name": "Uclahealthcareers",
      "skill_name": "tableau"
    },
    {
      "job_id": 1021647,
      "job_title_short": "Data Analyst",
      "job_location": "Anywhere",
      "salary_year_avg": "217000.0",
      "job_posted_date": "2023-01-17 00:17:23",
      "company_name": "Uclahealthcareers",
      "skill_name": "flow"
    },
    {
      "job_id": 168310,
      "job_title_short": "Data Analyst",
      "job_location": "Anywhere",
      "salary_year_avg": "205000.0",
      "job_posted_date": "2023-08-09 11:00:01",
      "company_name": "SmartAsset",
      "skill_name": "sql"
    },
    {
      "job_id": 168310,
      "job_title_short": "Data Analyst",
      "job_location": "Anywhere",
      "salary_year_avg": "205000.0",
      "job_posted_date": "2023-08-09 11:00:01",
      "company_name": "SmartAsset",
      "skill_name": "python"
    },
    {
      "job_id": 168310,
      "job_title_short": "Data Analyst",
      "job_location": "Anywhere",
      "salary_year_avg": "205000.0",
      "job_posted_date": "2023-08-09 11:00:01",
      "company_name": "SmartAsset",
      "skill_name": "go"
    },
    {
      "job_id": 168310,
      "job_title_short": "Data Analyst",
      "job_location": "Anywhere",
      "salary_year_avg": "205000.0",
      "job_posted_date": "2023-08-09 11:00:01",
      "company_name": "SmartAsset",
      "skill_name": "snowflake"
    },
    {
      "job_id": 168310,
      "job_title_short": "Data Analyst",
      "job_location": "Anywhere",
      "salary_year_avg": "205000.0",
      "job_posted_date": "2023-08-09 11:00:01",
      "company_name": "SmartAsset",
      "skill_name": "pandas"
    },
    {
      "job_id": 168310,
      "job_title_short": "Data Analyst",
      "job_location": "Anywhere",
      "salary_year_avg": "205000.0",
      "job_posted_date": "2023-08-09 11:00:01",
      "company_name": "SmartAsset",
      "skill_name": "numpy"
    },
    {
      "job_id": 168310,
      "job_title_short": "Data Analyst",
      "job_location": "Anywhere",
      "salary_year_avg": "205000.0",
      "job_posted_date": "2023-08-09 11:00:01",
      "company_name": "SmartAsset",
      "skill_name": "excel"
    },
    {
      "job_id": 168310,
      "job_title_short": "Data Analyst",
      "job_location": "Anywhere",
      "salary_year_avg": "205000.0",
      "job_posted_date": "2023-08-09 11:00:01",
      "company_name": "SmartAsset",
      "skill_name": "tableau"
    },
    {
      "job_id": 168310,
      "job_title_short": "Data Analyst",
      "job_location": "Anywhere",
      "salary_year_avg": "205000.0",
      "job_posted_date": "2023-08-09 11:00:01",
      "company_name": "SmartAsset",
      "skill_name": "gitlab"
    },
    {
      "job_id": 731368,
      "job_title_short": "Data Analyst",
      "job_location": "Anywhere",
      "salary_year_avg": "189309.0",
      "job_posted_date": "2023-12-07 15:00:13",
      "company_name": "Inclusively",
      "skill_name": "sql"
    },
    {
      "job_id": 731368,
      "job_title_short": "Data Analyst",
      "job_location": "Anywhere",
      "salary_year_avg": "189309.0",
      "job_posted_date": "2023-12-07 15:00:13",
      "company_name": "Inclusively",
      "skill_name": "python"
    },
    {
      "job_id": 731368,
      "job_title_short": "Data Analyst",
      "job_location": "Anywhere",
      "salary_year_avg": "189309.0",
      "job_posted_date": "2023-12-07 15:00:13",
      "company_name": "Inclusively",
      "skill_name": "azure"
    },
    {
      "job_id": 731368,
      "job_title_short": "Data Analyst",
      "job_location": "Anywhere",
      "salary_year_avg": "189309.0",
      "job_posted_date": "2023-12-07 15:00:13",
      "company_name": "Inclusively",
      "skill_name": "aws"
    },
    {
      "job_id": 731368,
      "job_title_short": "Data Analyst",
      "job_location": "Anywhere",
      "salary_year_avg": "189309.0",
      "job_posted_date": "2023-12-07 15:00:13",
      "company_name": "Inclusively",
      "skill_name": "oracle"
    },
    {
      "job_id": 731368,
      "job_title_short": "Data Analyst",
      "job_location": "Anywhere",
      "salary_year_avg": "189309.0",
      "job_posted_date": "2023-12-07 15:00:13",
      "company_name": "Inclusively",
      "skill_name": "snowflake"
    },
    {
      "job_id": 731368,
      "job_title_short": "Data Analyst",
      "job_location": "Anywhere",
      "salary_year_avg": "189309.0",
      "job_posted_date": "2023-12-07 15:00:13",
      "company_name": "Inclusively",
      "skill_name": "tableau"
    },
    {
      "job_id": 731368,
      "job_title_short": "Data Analyst",
      "job_location": "Anywhere",
      "salary_year_avg": "189309.0",
      "job_posted_date": "2023-12-07 15:00:13",
      "company_name": "Inclusively",
      "skill_name": "power bi"
    },
    {
      "job_id": 731368,
      "job_title_short": "Data Analyst",
      "job_location": "Anywhere",
      "salary_year_avg": "189309.0",
      "job_posted_date": "2023-12-07 15:00:13",
      "company_name": "Inclusively",
      "skill_name": "sap"
    },
    {
      "job_id": 731368,
      "job_title_short": "Data Analyst",
      "job_location": "Anywhere",
      "salary_year_avg": "189309.0",
      "job_posted_date": "2023-12-07 15:00:13",
      "company_name": "Inclusively",
      "skill_name": "jenkins"
    },
    {
      "job_id": 731368,
      "job_title_short": "Data Analyst",
      "job_location": "Anywhere",
      "salary_year_avg": "189309.0",
      "job_posted_date": "2023-12-07 15:00:13",
      "company_name": "Inclusively",
      "skill_name": "bitbucket"
    },
    {
      "job_id": 731368,
      "job_title_short": "Data Analyst",
      "job_location": "Anywhere",
      "salary_year_avg": "189309.0",
      "job_posted_date": "2023-12-07 15:00:13",
      "company_name": "Inclusively",
      "skill_name": "atlassian"
    },
    {
      "job_id": 731368,
      "job_title_short": "Data Analyst",
      "job_location": "Anywhere",
      "salary_year_avg": "189309.0",
      "job_posted_date": "2023-12-07 15:00:13",
      "company_name": "Inclusively",
      "skill_name": "jira"
    },
    {
      "job_id": 731368,
      "job_title_short": "Data Analyst",
      "job_location": "Anywhere",
      "salary_year_avg": "189309.0",
      "job_posted_date": "2023-12-07 15:00:13",
      "company_name": "Inclusively",
      "skill_name": "confluence"
    },
    {
      "job_id": 310660,
      "job_title_short": "Data Analyst",
      "job_location": "Anywhere",
      "salary_year_avg": "189000.0",
      "job_posted_date": "2023-01-05 00:00:25",
      "company_name": "Motional",
      "skill_name": "sql"
    },
    {
      "job_id": 310660,
      "job_title_short": "Data Analyst",
      "job_location": "Anywhere",
      "salary_year_avg": "189000.0",
      "job_posted_date": "2023-01-05 00:00:25",
      "company_name": "Motional",
      "skill_name": "python"
    },
    {
      "job_id": 310660,
      "job_title_short": "Data Analyst",
      "job_location": "Anywhere",
      "salary_year_avg": "189000.0",
      "job_posted_date": "2023-01-05 00:00:25",
      "company_name": "Motional",
      "skill_name": "r"
    },
    {
      "job_id": 310660,
      "job_title_short": "Data Analyst",
      "job_location": "Anywhere",
      "salary_year_avg": "189000.0",
      "job_posted_date": "2023-01-05 00:00:25",
      "company_name": "Motional",
      "skill_name": "git"
    },
    {
      "job_id": 310660,
      "job_title_short": "Data Analyst",
      "job_location": "Anywhere",
      "salary_year_avg": "189000.0",
      "job_posted_date": "2023-01-05 00:00:25",
      "company_name": "Motional",
      "skill_name": "bitbucket"
    },
    {
      "job_id": 310660,
      "job_title_short": "Data Analyst",
      "job_location": "Anywhere",
      "salary_year_avg": "189000.0",
      "job_posted_date": "2023-01-05 00:00:25",
      "company_name": "Motional",
      "skill_name": "atlassian"
    },
    {
      "job_id": 310660,
      "job_title_short": "Data Analyst",
      "job_location": "Anywhere",
      "salary_year_avg": "189000.0",
      "job_posted_date": "2023-01-05 00:00:25",
      "company_name": "Motional",
      "skill_name": "jira"
    },
    {
      "job_id": 310660,
      "job_title_short": "Data Analyst",
      "job_location": "Anywhere",
      "salary_year_avg": "189000.0",
      "job_posted_date": "2023-01-05 00:00:25",
      "company_name": "Motional",
      "skill_name": "confluence"
    },
    {
      "job_id": 1749593,
      "job_title_short": "Data Analyst",
      "job_location": "Anywhere",
      "salary_year_avg": "186000.0",
      "job_posted_date": "2023-07-11 16:00:05",
      "company_name": "SmartAsset",
      "skill_name": "sql"
    },
    {
      "job_id": 1749593,
      "job_title_short": "Data Analyst",
      "job_location": "Anywhere",
      "salary_year_avg": "186000.0",
      "job_posted_date": "2023-07-11 16:00:05",
      "company_name": "SmartAsset",
      "skill_name": "python"
    },
    {
      "job_id": 1749593,
      "job_title_short": "Data Analyst",
      "job_location": "Anywhere",
      "salary_year_avg": "186000.0",
      "job_posted_date": "2023-07-11 16:00:05",
      "company_name": "SmartAsset",
      "skill_name": "go"
    },
    {
      "job_id": 1749593,
      "job_title_short": "Data Analyst",
      "job_location": "Anywhere",
      "salary_year_avg": "186000.0",
      "job_posted_date": "2023-07-11 16:00:05",
      "company_name": "SmartAsset",
      "skill_name": "snowflake"
    },
    {
      "job_id": 1749593,
      "job_title_short": "Data Analyst",
      "job_location": "Anywhere",
      "salary_year_avg": "186000.0",
      "job_posted_date": "2023-07-11 16:00:05",
      "company_name": "SmartAsset",
      "skill_name": "pandas"
    },
    {
      "job_id": 1749593,
      "job_title_short": "Data Analyst",
      "job_location": "Anywhere",
      "salary_year_avg": "186000.0",
      "job_posted_date": "2023-07-11 16:00:05",
      "company_name": "SmartAsset",
      "skill_name": "numpy"
    },
    {
      "job_id": 1749593,
      "job_title_short": "Data Analyst",
      "job_location": "Anywhere",
      "salary_year_avg": "186000.0",
      "job_posted_date": "2023-07-11 16:00:05",
      "company_name": "SmartAsset",
      "skill_name": "excel"
    },
    {
      "job_id": 1749593,
      "job_title_short": "Data Analyst",
      "job_location": "Anywhere",
      "salary_year_avg": "186000.0",
      "job_posted_date": "2023-07-11 16:00:05",
      "company_name": "SmartAsset",
      "skill_name": "tableau"
    },
    {
      "job_id": 1749593,
      "job_title_short": "Data Analyst",
      "job_location": "Anywhere",
      "salary_year_avg": "186000.0",
      "job_posted_date": "2023-07-11 16:00:05",
      "company_name": "SmartAsset",
      "skill_name": "gitlab"
    },
    {
      "job_id": 387860,
      "job_title_short": "Data Analyst",
      "job_location": "Anywhere",
      "salary_year_avg": "184000.0",
      "job_posted_date": "2023-06-09 08:01:04",
      "company_name": "Get It Recruit - Information Technology",
      "skill_name": "sql"
    },
    {
      "job_id": 387860,
      "job_title_short": "Data Analyst",
      "job_location": "Anywhere",
      "salary_year_avg": "184000.0",
      "job_posted_date": "2023-06-09 08:01:04",
      "company_name": "Get It Recruit - Information Technology",
      "skill_name": "python"
    },
    {
      "job_id": 387860,
      "job_title_short": "Data Analyst",
      "job_location": "Anywhere",
      "salary_year_avg": "184000.0",
      "job_posted_date": "2023-06-09 08:01:04",
      "company_name": "Get It Recruit - Information Technology",
      "skill_name": "r"
    }
  ]

*/