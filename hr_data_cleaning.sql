CREATE DATABASE human_resource;

USE human_resource;

SELECT * FROM hr;

-- DATA CLEANING WITH SQL

-- 1. Change first column name
-- ===========================
ALTER TABLE hr
CHANGE COLUMN ï»¿id emp_id TEXT NULL;

SELECT * FROM hr;

-- List column names and datatypes.
DESCRIBE hr;

-- 2. Explore the birthdate column.
-- ================================
SELECT birthdate FROM hr;

-- Set sql safe updates to 0
SET sql_safe_updates = 0;
SET GLOBAL sql_mode = 'NO_ENGINE_SUBSTITUTION';
SET SESSION sql_mode = 'NO_ENGINE_SUBSTITUTION';

-- birthdate has inconsistent date format, hence needs cleaning.
UPDATE hr
SET birthdate = CASE
    WHEN birthdate LIKE '%/%' THEN date_format(str_to_date(birthdate, '%m/%d/%Y'), '%Y-%m-%d')
	WHEN birthdate LIKE '%-%' THEN date_format(str_to_date(birthdate, '%m-%d-%Y'), '%Y-%m-%d')
	ELSE NULL
END;

SELECT birthdate FROM hr;

DESCRIBE hr;

-- 3. Change birthdate data type from text/string to date data type.
-- =================================================================
ALTER TABLE hr
MODIFY COLUMN birthdate DATE;

DESCRIBE hr;

-- 4. Explore the hire_date column.
-- ================================
SELECT hire_date FROM hr;

-- hire_date has inconsistent date format, hence needs cleaning.
UPDATE hr
SET hire_date = CASE
    WHEN hire_date LIKE '%/%' THEN date_format(str_to_date(hire_date, '%m/%d/%Y'), '%Y-%m-%d')
	WHEN hire_date LIKE '%-%' THEN date_format(str_to_date(hire_date, '%m-%d-%Y'), '%Y-%m-%d')
	ELSE NULL
END;

SELECT hire_date FROM hr;

-- 5. Change hire_date data type from text/string to date data type.
-- ================================================================
ALTER TABLE hr
MODIFY COLUMN hire_date DATE;

DESCRIBE hr;

-- 6. Explore the termdate column.
-- ===============================
SELECT termdate FROM hr;

-- Fill missing values
UPDATE hr
SET termdate = '0000-00-00 00:00:00 UTC'
WHERE termdate = '';

SELECT termdate FROM hr;

-- Change termdate format.
UPDATE hr
SET termdate = date(str_to_date(termdate, '%Y-%m-%d %H:%i:%s UTC'));

SELECT termdate FROM hr;

DESCRIBE hr;

-- 7. Change termdate data type from text/string to date data type.
-- ================================================================
ALTER TABLE hr
MODIFY COLUMN termdate DATE;

DESCRIBE hr;

-- 8. Add a column for age
-- =======================
ALTER TABLE hr ADD COLUMN age INT;

DESCRIBE hr;
SELECT * FROM hr;

UPDATE hr
SET age = timestampdiff(YEAR, birthdate, CURDATE());

-- Check for wrong age
SELECT birthdate, age FROM hr
WHERE age < 0;

-- Count wrong number of rows of age
SELECT COUNT(*) FROM hr
WHERE age < 0;

SELECT MIN(age) AS youngest, MAX(age) AS oldest
FROM hr;

-- Count number of rows of age less than 18
SELECT COUNT(*) FROM hr
WHERE age < 18;