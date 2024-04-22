-- DROP TABLE title;
-- DROP TABLE employees;
-- DROP TABLE salaries;
-- DROP TABLE departments;
-- DROP TABLE employee_dept;
-- DROP TABLE manager_dept;
CREATE TABLE title (
	title_id VARCHAR(5) PRIMARY KEY NOT NULL,
	title VARCHAR(30) NOT NULL
);

CREATE TABLE employees (
	emp_no INT PRIMARY KEY NOT NULL,
	emp_title_id VARCHAR(5) NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR(30) NOT NULL,
	last_name VARCHAR(30),
	sex CHAR(1) NOT NULL,
	hire_date DATE NOT NULL,
	FOREIGN KEY (emp_title_id) REFERENCES title(title_id)
);

CREATE TABLE salaries (
	emp_no INT PRIMARY KEY NOT NULL,
	salary INT NOT NuLL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE departments (
	dept_no VARCHAR(4) PRIMARY KEY NOT NULL,
	dept_name VARCHAR(30) NOT NULL
);

CREATE TABLE employee_dept (
	emp_no INT NOT NULL,
	dept_no VARCHAR(4) NOT NULL,
	PRIMARY KEY(emp_no, dept_no)
);

CREATE TABLE manager_dept (
	dept_no VARCHAR(4) NOT NULL,
	emp_no INT NOT NULL,
	PRIMARY KEY(dept_no, emp_no)
);

ALTER TABLE employee_dept ADD CONSTRAINT fk_emp_no FOREIGN KEY(emp_no)
REFERENCES employees(emp_no);

ALTER TABLE employee_dept ADD CONSTRAINT fk_dept_no FOREIGN KEY(dept_no)
REFERENCES departments(dept_no);

ALTER TABLE manager_dept ADD CONSTRAINT fk_manager_emp_no FOREIGN KEY(dept_no)
REFERENCES departments(dept_no);

ALTER TABLE manager_dept ADD CONSTRAINT fk_manager_dept_no FOREIGN KEY(emp_no)
REFERENCES employees(emp_no);