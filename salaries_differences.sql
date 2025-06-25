# diff b/w highest salaries in marketing and engineering
# get highest salaries from both marketing and engineering
# get the diff

WITH salaries AS (
  SELECT MAX(salary) AS salary, db_dept.department
  FROM db_employee
  JOIN db_dept ON db_dept.id = db_employee.department_id
  WHERE db_dept.department IN ('marketing', 'engineering')
  GROUP BY db_dept.department
)

SELECT 
  ABS(
    MAX(CASE WHEN department = 'marketing' THEN salary END) -
    MAX(CASE WHEN department = 'engineering' THEN salary END)
  ) AS salary_difference
FROM salaries;
