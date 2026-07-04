/*
Create 3 tables of 
    -2023 jan jobs
    -2023 feb jobs
    -2023 mar jobs
*/

-- January
CREATE TABLE January_jobs AS
    SELECT * 
    FROM 
        job_postings_fact
    WHERE 
        EXTRACT(MONTH FROM job_posted_date) = 1;

-- February
CREATE TABLE February_jobs AS
    SELECT * 
    FROM 
        job_postings_fact
    WHERE 
        EXTRACT(MONTH FROM job_posted_date) = 2;

-- March
CREATE TABLE March_jobs AS
    SELECT * 
    FROM 
        job_postings_fact
    WHERE 
        EXTRACT(MONTH FROM job_posted_date) = 3;


SELECT job_posted_date
FROM March_jobs;