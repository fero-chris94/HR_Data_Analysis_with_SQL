# HR_Data_Analysis_with_SQL
Welcome to my SQL Data Cleaning and Exploratory Data Analysis project repository! This project focuses on cleaning and analyzing a human resource dataset using SQL queries. By applying SQL data cleaning techniques and running insightful queries, we can gain valuable insights into various aspects of the dataset.

# Project Overview
In this project, I have utilized SQL to clean and analyze a human resource dataset. The dataset contains information about employees, including their demographics, dates of birth, hire dates, termination dates, job titles, departments, and locations. The project consists of two main parts: data cleaning and exploratory data analysis. At the end, the clean file was exported to PowerBI, where results were visualized.

## Data Cleaning with SQL
In the data cleaning phase, I have performed several SQL queries to clean and preprocess the dataset. The following tasks were completed:

- Changed the first column name to "emp_id".
- Explored and cleaned the "birthdate" column, ensuring consistent date formats.
- Changed the data type of the "birthdate" column from text/string to the date data type.
- Explored and cleaned the "hire_date" column, ensuring consistent date formats.
- Changed the data type of the "hire_date" column from text/string to the date data type.
- Explored and cleaned the "termdate" column, filling missing values and changing the date format.
- Changed the data type of the "termdate" column from text/string to the date data type.
- Added a new column, "age", to calculate the age of employees based on their birthdate.
- Checked for incorrect age values, ensuring all ages are greater than or equal to zero.

## Exploratory Data Analysis with SQL
In the exploratory data analysis phase, I have used SQL queries to answer various questions and gain insights into the dataset. The following questions have been addressed:

- Gender Breakdown: Analyzed the gender distribution of employees in the company.
- Race/Ethnicity Breakdown: Examined the race/ethnicity breakdown of employees in the company.
- Age Distribution: Explored the age distribution of employees in the company.
- Headquarters vs. Remote Locations: Determined the number of employees working at headquarters versus remote locations.
- Average Length of Employment: Calculated the average length of employment for terminated employees.
- Gender Distribution by Departments and Job Titles: Analyzed the gender distribution/count across departments and job titles.
- Job Title Distribution: Examined the distribution/count of job titles across the company.
- Department with the Highest Turnover Rate: Identified the department with the highest turnover rate.
- Employee Distribution by Locations: Explored the distribution/count of employees across locations by city and state.
- Employee Count Changes Over Time: Analyzed how the company's employee count has changed over time based on hire and termination dates.

Feel free to explore the SQL queries provided to gain a deeper understanding of the dataset and the insights obtained through data analysis.

## Technologies Used
The project was implemented using the following technologies:

- SQL: Utilized for data cleaning and exploratory data analysis tasks.
- Database Management System: Used to create the "human_resource" database and execute SQL queries.
- PowerBI : Used to Analyze and Visualize Analysis results.

## Project Files
The following files are included in this repository:

- hr_data_cleaning.sql: SQL script for data cleaning tasks.
- hr_analysis.sql: SQL script for exploratory data analysis queries.
- hr_analytics.pbix: PowerBI file for Visulisation of Reports. 
- HumanResource.csv: PDF report generated from PowerBI
- README.md: This readme file providing an overview of the project and its contents.

Please note that the SQL scripts assume the existence of a "human_resource" database. Make sure to set up the database before executing the queries.

## Results
The SQL data cleaning and exploratory data analysis queries have provided valuable insights into the human resource dataset. The results of the analysis can be found in the respective SQL files (hr_data_cleaning.sql and hr_analysis.sql). Each query's output and corresponding insights are documented within the SQL files.
Visualised results can be found in the PowerBI file (hr_analytics.pbix)

Feel free to explore the SQL query results to gain a comprehensive understanding of the dataset and the derived insights.

## Contributing
Contributions to this project are welcome! If you have any suggestions, improvements, or additional insights related to the data cleaning or exploratory data analysis, feel free to open an issue or submit a pull request. Your contributions can help enhance the project and provide additional value to others.

## License
The content of this repository is licensed under the MIT License. You are free to use, modify, and distribute the code and content for personal or commercial purposes. However, please note that this license only covers the content within this repository and not any external dependencies or databases that may be referenced.
