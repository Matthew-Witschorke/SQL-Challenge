drop table if exists titles cascade;
drop table if exists departments cascade;
drop table if exists employees cascade;
drop table if exists salaries cascade;
drop table if exists dept_manager cascade;
drop table if exists dept_emp cascade;



CREATE TABLE "employees" (
    "emp_no" int   NOT NULL,
    "emp_title_id" varchar(10)   NOT NULL,
    "birth_date" date   NOT NULL,
    "first_name" varchar(50)   NOT NULL,
    "last_name" varchar(50)   NOT NULL,
    "sex" varchar(15)   NOT NULL,
    "hire_date" date   NOT NULL,
	PRIMARY KEY (emp_no),
    "last_updated" timestamp default localtimestamp NOT NULL
);

SELECT * FROM employees;

CREATE TABLE "titles" (
    "title_id" varchar(10) PRIMARY KEY NOT NULL,
    "title" varchar(25)   NOT NULL,
    "last_updated" timestamp default localtimestamp NOT NULL
);

SELECT * FROM titles;

CREATE TABLE "salaries" (
    "emp_no" int   NOT NULL,
    "salary" int   NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    "last_updated" timestamp default localtimestamp NOT NULL
);

SELECT * FROM salaries;

CREATE TABLE "dept_manager" (
    "dept_no" varchar(15)   NOT NULL,
    "emp_no" int   NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
    "last_updated" timestamp default localtimestamp NOT NULL
);

SELECT * FROM dept_manager;

CREATE TABLE "dept_emp" (
    "emp_no" int   NOT NULL,
    "dept_no" varchar(15)   NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
    "last_updated" timestamp default localtimestamp NOT NULL	
);

SELECT * FROM dept_emp;

CREATE TABLE "departments" (
    "dept_no" varchar(15)   NOT NULL,
    "dept_name" varchar(30)   NOT NULL,
	PRIMARY KEY (dept_no),
    "last_updated" timestamp default localtimestamp NOT NULL
);

SELECT * FROM departments;

ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_emp_title_id" FOREIGN KEY("emp_title_id")
REFERENCES "titles" ("title_id");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");
