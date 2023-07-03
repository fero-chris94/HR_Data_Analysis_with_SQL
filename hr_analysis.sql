-- Questions
-- What is the gender breakdown of employees in the company?
-- What is the race/ethnicity breakdown of employees in the company?
-- What is the age distribution of employees in the company?
-- How many employees work at headquarters versus remote locations?
-- What is the average length of employment for employees who have been terminated?
-- How does the gender distribution/count vary across departments and job titles?
-- What is the distribution/count of job titles across the company?
-- Which department has the highest turnover rate?
-- What is the distribution/count of employees across locations by city and state?
-- How has the company's employee count changed over time based on hire and term dates?

-- Answers
USE human_resource;

-- 1. What is the gender breakdown of employees in the company?
SELECT gender, COUNT(*) AS gender_count
FROM hr
WHERE age >= 18 AND termdate = '0000-00-00'
GROUP BY gender;

-- 2. What is the race/ethnicity breakdown of employees in the company?
SELECT race, COUNT(*) AS race_count
FROM hr
WHERE age >= 18 AND termdate = '0000-00-00'
GROUP BY race
ORDER BY race_count DESC;

-- 3. What is the age distribution of employees in the company?
SELECT MIN(age) AS min_age, MAX(age) AS max_age
FROM hr
WHERE age >= 18 AND termdate = '0000-00-00';

SELECT 
  CASE 
    WHEN age >= 18 AND age <= 24 THEN '18-24'
    WHEN age >= 25 AND age <= 34 THEN '25-34'
    WHEN age >= 35 AND age <= 44 THEN '35-44'
    WHEN age >= 45 AND age <= 54 THEN '45-54'
    WHEN age >= 55 AND age <= 64 THEN '55-64'
    ELSE '65+'
  END AS age_group,
  COUNT(*) AS count
FROM hr
WHERE age >= 18 AND termdate = '0000-00-00'
GROUP BY age_group
ORDER BY age_group;

SELECT 
  CASE 
    WHEN age >= 18 AND age <= 24 THEN '18-24'
    WHEN age >= 25 AND age <= 34 THEN '25-34'
    WHEN age >= 35 AND age <= 44 THEN '35-44'
    WHEN age >= 45 AND age <= 54 THEN '45-54'
    WHEN age >= 55 AND age <= 64 THEN '55-64'
    ELSE '65+'
  END AS age_group,
  gender,
  COUNT(*) AS count
FROM hr
WHERE age >= 18 AND termdate = '0000-00-00'
GROUP BY age_group, gender
ORDER BY age_group, gender;

-- 4. How many employees work at headquarters versus remote locations?
SELECT location, COUNT(*) AS employee_count
FROM hr
WHERE age >= 18 AND termdate = '0000-00-00'
GROUP BY location;

-- 5. What is the average length of employment for employees who have been terminated?
SELECT ROUND(AVG(length_of_stay), 0) AS avg_length_of_stay
FROM (SELECT termdate, YEAR(termdate) - YEAR(hire_date) AS length_of_stay
	 FROM hr
	 WHERE age >= 18 AND termdate > '0000-00-00' AND termdate < '2023-00-00') AS t;

-- 6. How does the gender distribution/count vary across departments and job titles?
SELECT department, jobtitle, gender, COUNT(*) AS gender_count
FROM hr
WHERE age >= 18 AND termdate = '0000-00-00'
GROUP BY department, jobtitle, gender
ORDER BY department;

-- 7. What is the distribution/count of job titles across the company?
SELECT jobtitle, COUNT(*) AS Job_Title_Count
FROM hr
WHERE age >= 18 AND termdate = '0000-00-00'
GROUP BY jobtitle
ORDER BY jobtitle;

-- 8. Which department has the highest turnover rate?
SELECT department,
  total_count,
  terminated_count,
  terminated_count/total_count AS termination_rate
FROM (
  SELECT department,
    COUNT(*) AS total_count,
    SUM(CASE WHEN termdate <> '0000-00-00' AND termdate <= CURDATE() THEN 1 ELSE 0 END) AS terminated_count
  FROM hr
  WHERE age >= 18
  GROUP BY department) AS t
ORDER BY termination_rate DESC;

-- 9. What is the distribution/count of employees across locations by city and state?
SELECT location, location_city, location_state, COUNT(*) AS employee_count
FROM hr
WHERE age >= 18 AND termdate = '0000-00-00'
GROUP BY location, location_city, location_state
ORDER BY employee_count DESC;

-- 10. How has the company's employee count changed over time based on hire and term dates?
SELECT
  year, 
  hires, 
  terminations,
  hires - terminations AS net_change,
  ROUND(((hires - terminations)/hires) * 100, 2) AS net_change_percent
FROM (
  SELECT 
    YEAR(hire_date) AS year,
    COUNT(*) AS hires,
    SUM(CASE WHEN termdate <> '0000-00-00' AND termdate <= CURDATE() THEN 1 ELSE 0 END) AS terminations
  FROM hr
  WHERE age >= 18
  GROUP BY YEAR(hire_date)
  ) AS t
ORDER BY year ASC;