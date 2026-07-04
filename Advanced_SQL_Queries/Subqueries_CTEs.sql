
-- SUBQUERY
SELECT *
FROM (
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1
) AS january_jobs;


--CTEs

WITH January_jobs AS (
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1
)

SELECT * FROM January_jobs;


-- Companies that requires no degree
SELECT name
FROM company_dim
WHERE company_id IN (
    SELECT company_id
    FROM job_postings_fact
    WHERE job_no_degree_mention = TRUE
);

/*
Find the companies that have the most job openings.
- Get the total number of job postings per company id (job postings fact)
- Return the total number of jobs with the company name (company dim)
*/


WITH company_job_count AS (
        SELECT 
            company_id,
            COUNT(*) AS total_jobs
        FROM 
            job_postings_fact
        GROUP BY 
            company_id
)

SELECT
    company_dim.name AS company_name,
    company_job_count.total_jobs
FROM company_dim
LEFT JOIN
    company_job_count 
ON 
    company_job_count.company_id = company_dim.company_id
ORDER BY
    company_job_count.total_jobs DESC;
