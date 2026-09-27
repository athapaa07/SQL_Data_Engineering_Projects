# Exploratory Data Analysis w/SQL: Job Market Analysis

![Project 1 Overview](../Images\1_1_Project1_EDA.png)

A SQL Project analyzing the data engineer job market using real world job posting data. It demonstrates my ability to **write production-quality analytical SQL, design efficient queries, and turn business questions into data-driven insights**.

## Executive Summary

- **Project Scope:** Build **3 analyutical queries** that answer key questions about the data engineer job market
- **Data modeling:** Used **multi-table joins** across dact and dimension tables to extract insights
- **Analytics:** Applied **aggregations, filtering, and sorting** to find top skills by demand, salary, and overall value
- **Outcomes:** Delivered **actionable insights** on SQL/Python dominance, cloud trends, and salary patterns

If you only have a minute, review these:

1. [Top Demanded Skills Query](01_top_demanded_skills.sql) - demand analysis with multi-table joins
2. [Top Paying Skills](02_top_paying_skills.sql) - salary analysis with aggregartions
3. [Optimal Skills](03_most_optimal_skills.sql) - combined demand/salary optimization query

## Problem & Context

Job market analysts need to answer questions like:

- **Most in-demand:** *Which skills are most in-demand for Data Engineers?*
- **Highest Paid:** *Which skills commands the highest salaries?*
- **Best trade-off:** *What is the optimal skill set balancing demand and compensation?*

This project analyzes a **data warehouse** built using a star schema design. The warehouse structure consists of :

![Data Warehouse](../Images/1_2_Data_Warehouse.png)

- **Fact Table:** `Job_postings_fact` - Central Table containing job posting details (Job titles, locations, salaries, dates, etc.)
- **Dimension Tables:** 
    - `company_dim` - Company information linked to job postings
    - `skills_dim` - Skills catalog with skill names and types
- **Bridge Table:** `skills_job_dim` - Resolves the many-to-many relationships between job postings and skills

By quering across these interconnected tables, I extracted insights about skill demand, salary patterns, and optimal skill combinations for data engineering roles.


## Tech Stack
 - **Query Engine:** DuckBD for fast OLAP-style analytical queries
 - **Language:** SQL (ANSI-style with analytical functions)
 - **Data Model:** Star Schema with fact + dimension + bridge tables
 - **Development:** VS Code for SQL editing + Terminal fo DuckDB CLI
 - **Version Control:** Git/GitHub for versioned SQl scripts 

## Analysis Overview

### Query Structure

1. **[Top Demanded Skills](./01_top_demanded_skills.sql)** - Identifies the 10 most in-demand skills for remote data engineer positions
2. **[Top Paying Skills](./02_top_paying_skills.sql)** - Analyzes the 25 highest-paying skills with salary and deamand metrics
3. **[Optimal Skills](./03_most_optimal_skills.sql)** - Calculates an optimal score using natural log of demand combined with median salary to identify the most valuable skills to learn

### Key Insights

- Core language: SQL and python each appear in~29,000 job postings, making them the most demanded skills
- Cloud Platform: AWS and Azure are critical for modern data engineering roles
- Infra & Tooling: Kubernetes, Docker, and Terraform are associated with premium salaries
- Big data Tools: Apache Spark shows strong demand with competitive compensation

## SQL Skills Demonstrated

### Query Design & Optimization

- **Complex Joins:** Multi-table `INNER JOIN` operations across `job_postings_fact`, `skills_job_dim`, and `skills_dim`
- **Aggregations:** `COUNT()`, `MEDIAN()`, `ROUND()` for statistical analysis
- **Filtering:** `Boolen logic with `WHERE` clauses and multiple conditions
(job_title_short`, `job_work_from_home`, `salary_year_avg IS NOT NULL`)
- **Sorting & Limiting:** `ORDER BY` with `DESC` and `LIMIT` for top-N analysis

### Data Analysis Techniques

- **Grouping:** `GROUP BY` for categorical analysis by skill
- **Conditional Logic:** `CASE WHEN` statements for delivered metrics
- **Mathematical Functions:** `LN()` for natural logarithm transformation to normalizw demand metrics
- **Calculated Metrics:** Derived optimal score combining log-transformed demand with median salary
- **HAVING clauses:** FIltering aggregated results (skills with >= 100 postings)
- **NULL handling:** Proper filtering of incomplete records (`salary_year_avg IS NOT NULL`)