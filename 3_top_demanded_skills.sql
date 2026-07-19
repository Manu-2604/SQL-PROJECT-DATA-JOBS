/* QUESTION 3: What are the most in demand skills for Data Analysts?
   - Join job postings to inner join table similar to query 2.
   - Identify the top 5 in-demand skills for a data analyst. 
   - Focus on all job postings.
   - Why? Retrieve the top 5 skills with the highest demand in the job market, 
     Providing insights into the most valuable skills for job seekers.
*/

SELECT skills_dim.skills,
       COUNT(skills_job_dim.job_id )AS demand_count,
       job_postings_fact.job_title_short
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE 
      job_title_short = 'Data Analyst' 
       AND job_work_from_home = TRUE
GROUP BY skills_dim.skills , job_postings_fact.job_title_short
ORDER BY demand_count DESC
LIMIT 5

/* KEY INSIGHTS:  
    - The remote Data Analyst job market in 2023 emphasizes a balanced skill set rather than a single tool. 
    - SQL remains the indispensable foundation, while Excel and Python support data preparation and analysis. 
    - Tableau and Power BI round out the toolkit by enabling analysts to create clear, actionable visualizations for stakeholders. 
    - Candidates who combine database querying, programming, spreadsheet proficiency, and 
      data visualization are well-positioned to meet the expectations of employers hiring for remote Data Analyst roles.

  [
    {
      "skills": "sql",
      "demand_count": "7291",
      "job_title_short": "Data Analyst"
    },
    {
      "skills": "excel",
      "demand_count": "4611",
      "job_title_short": "Data Analyst"
    },
    {
      "skills": "python",
      "demand_count": "4330",
      "job_title_short": "Data Analyst"
    },
    {
      "skills": "tableau",
      "demand_count": "3745",
      "job_title_short": "Data Analyst"
    },
    {
      "skills": "power bi",
      "demand_count": "2609",
      "job_title_short": "Data Analyst"
    }
  ]

*/