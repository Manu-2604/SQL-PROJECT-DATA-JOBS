/* QUESTION 4: What are the top skills based on salary?
   - Look at the average salary associated with each skill for Data Analyst positions.
   - Focuses on roles with specified salaries, regardless of location.
   - Why? It reveals how different skills impact salary levels for Data Analysts and 
     helps identify the most financially rewarding skill to acquire (or) improve.
*/

SELECT skills_dim.skills,
         ROUND (AVG(salary_year_avg),0) AS avg_salary,
       job_postings_fact.job_title_short
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE 
      job_title_short = 'Data Analyst' 
      -- AND job_work_from_home = TRUE
      AND salary_year_avg IS NOT NULL
GROUP BY skills_dim.skills , job_postings_fact.job_title_short
ORDER BY avg_salary DESC
LIMIT 25

/* KEY INSIGHTS:
    - High-paying Data Analyst roles increasingly value expertise beyond traditional analytics,particularly in cloud computing,
      machine learning, and modern data infrastructure. 
    - Foundational skills like SQL and Python remain essential,but combining them with specialized technologies can
      significantly increase earning potential.
    - Continuous upskilling in emerging tools and platforms** can help Data Analysts qualify for more advanced roles and higher salaries.

    [
    {
        "skills": "svn",
        "avg_salary": "400000",
        "job_title_short": "Data Analyst"
    },
    {
        "skills": "solidity",
        "avg_salary": "179000",
        "job_title_short": "Data Analyst"
    },
    {
        "skills": "couchbase",
        "avg_salary": "160515",
        "job_title_short": "Data Analyst"
    },
    {
        "skills": "datarobot",
        "avg_salary": "155486",
        "job_title_short": "Data Analyst"
    },
    {
        "skills": "golang",
        "avg_salary": "155000",
        "job_title_short": "Data Analyst"
    },
    {
        "skills": "mxnet",
        "avg_salary": "149000",
        "job_title_short": "Data Analyst"
    },
    {
        "skills": "dplyr",
        "avg_salary": "147633",
        "job_title_short": "Data Analyst"
    },
    {
        "skills": "vmware",
        "avg_salary": "147500",
        "job_title_short": "Data Analyst"
    },
    {
        "skills": "terraform",
        "avg_salary": "146734",
        "job_title_short": "Data Analyst"
    },
    {
        "skills": "twilio",
        "avg_salary": "138500",
        "job_title_short": "Data Analyst"
    },
    {
        "skills": "gitlab",
        "avg_salary": "134126",
        "job_title_short": "Data Analyst"
    },
    {
        "skills": "kafka",
        "avg_salary": "129999",
        "job_title_short": "Data Analyst"
    },
    {
        "skills": "puppet",
        "avg_salary": "129820",
        "job_title_short": "Data Analyst"
    },
    {
        "skills": "keras",
        "avg_salary": "127013",
        "job_title_short": "Data Analyst"
    },
    {
        "skills": "pytorch",
        "avg_salary": "125226",
        "job_title_short": "Data Analyst"
    },
    {
        "skills": "perl",
        "avg_salary": "124686",
        "job_title_short": "Data Analyst"
    },
    {
        "skills": "ansible",
        "avg_salary": "124370",
        "job_title_short": "Data Analyst"
    },
    {
        "skills": "hugging face",
        "avg_salary": "123950",
        "job_title_short": "Data Analyst"
    },
    {
        "skills": "tensorflow",
        "avg_salary": "120647",
        "job_title_short": "Data Analyst"
    },
    {
        "skills": "cassandra",
        "avg_salary": "118407",
        "job_title_short": "Data Analyst"
    },
    {
        "skills": "notion",
        "avg_salary": "118092",
        "job_title_short": "Data Analyst"
    },
    {
        "skills": "atlassian",
        "avg_salary": "117966",
        "job_title_short": "Data Analyst"
    },
    {
        "skills": "bitbucket",
        "avg_salary": "116712",
        "job_title_short": "Data Analyst"
    },
    {
        "skills": "airflow",
        "avg_salary": "116387",
        "job_title_short": "Data Analyst"
    },
    {
        "skills": "scala",
        "avg_salary": "115480",
        "job_title_short": "Data Analyst"
    }
    ]
*/