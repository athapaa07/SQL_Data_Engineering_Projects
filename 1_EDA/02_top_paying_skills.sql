/*
Question: What are the highest-paying skills for data engineers?
- Calculate the median salary for each skill required in data engineer positions
- Focus on remote positions with specified salaries
- Include skill frequency to identify both salary and demand
- Why? Helps identify which skills command the highest compensation while also showing
    how common those skills are, providing a more complete picture for skill development priorities
*/

SELECT 
    sd.skills,
    ROUND(MEDIAN(jpf.salary_year_avg), 0) AS median_salary,
    COUNT(jpf.*) AS demand_count
FROM  job_postings_fact AS jpf
INNER JOIN skills_job_dim AS sjd
    ON jpf.job_id = sjd.job_id
INNER JOIN skills_dim AS sd
    ON sjd.skill_id = sd.skill_id
WHERE
    jpf.job_title_short = 'Data Engineer'
    AND jpf.job_work_from_home = TRUE
GROUP BY 
    sd.skills
HAVING 
    COUNT(jpf.*) > 100
ORDER BY 
    median_salary DESC
LIMIT 25;

/*
┌────────────┬───────────────┬──────────────┐
│   skills   │ median_salary │ demand_count │
│  varchar   │    double     │    int64     │
├────────────┼───────────────┼──────────────┤
│ rust       │      210000.0 │          232 │
│ terraform  │      184000.0 │         3248 │
│ golang     │      184000.0 │          912 │
│ spring     │      175500.0 │          364 │
│ neo4j      │      170000.0 │          277 │
│ gdpr       │      169616.0 │          582 │
│ zoom       │      168438.0 │          127 │
│ graphql    │      167500.0 │          445 │
│ mongo      │      162250.0 │          265 │
│ fastapi    │      157500.0 │          204 │
│ bitbucket  │      155000.0 │          478 │
│ django     │      155000.0 │          265 │
│ crystal    │      154224.0 │          129 │
│ atlassian  │      151500.0 │          249 │
│ c          │      151500.0 │          444 │
│ typescript │      151000.0 │          388 │
│ kubernetes │      150500.0 │         4202 │
│ ruby       │      150000.0 │          736 │
│ css        │      150000.0 │          262 │
│ airflow    │      150000.0 │         9996 │
│ node       │      150000.0 │          179 │
│ redis      │      149000.0 │          605 │
│ vmware     │      148798.0 │          136 │
│ ansible    │      148798.0 │          475 │
│ jupyter    │      147500.0 │          400 │
└────────────┴───────────────┴──────────────┘
*/


/* Insights:
- Systems languages pay highest: Rust ($210k) and Golang ($184k) top the list because high-performance data engines and low-latency streaming tools rely on them.
- DevOps / IaC drives big premiums: Terraform ($184k) and Kubernetes ($150.5k) show employers pay heavily for engineers who automate and deploy cloud infrastructure, not just write queries.
- High pay doesn't equal high demand: Top earners like Rust (232 postings) and Go (912 postings) are niche senior specializations, not everyday entry-level baselines.
- The sweet spot is Airflow: With a median salary of $150k across 9,996 postings, Airflow offers both top-tier compensation and massive market demand.
-Specialized databases beat relational tools: Graph databases like Neo4j ($170k) command higher pay than standard SQL databases due to enterprise use cases like fraud detection and recommendation graphs.
*/