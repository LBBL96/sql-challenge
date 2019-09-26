-- this is an alternative schema that sets primary keys
-- because the datasets do not have an 'id' column, this did not run successfully
-- However, manually inserting a column in PostgresQL and giving it the attribute serial
-- will provide an id column for those tables that don't already have a column of unique identifiers.

CREATE TABLE "Departments" (
    "dept_no" varchar(5)   NOT NULL,
    "dept_name" varchar(50)   NOT NULL,
    CONSTRAINT "pk_Departments" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "DeptEmployees" (
    "id" serial   NOT NULL,
    "emp_no" int   NOT NULL,
    "dept_no" varchar(5)   NOT NULL,
    "from_date" varchar(10)   NOT NULL,
    CONSTRAINT "pk_DeptEmployees" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "DeptManager" (
    "id" serial   NOT NULL,
    "dept_no" varchar(5)   NOT NULL,
    "emp_no" int   NOT NULL,
    "from_date" varchar(10)   NOT NULL,
    "to_date" varchar(10)   NOT NULL,
    CONSTRAINT "pk_DeptManager" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Employees" (
    "emp_no" int   NOT NULL,
    "birth_date" varchar(10)   NOT NULL,
    "first_name" varchar(30)   NOT NULL,
    "last_name" varchar(30)   NOT NULL,
    "gender" varchar(1)   NOT NULL,
    "hire_date" varchar(10)   NOT NULL,
    CONSTRAINT "pk_Employees" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "Salaries" (
    "id" serial   NOT NULL,
    "emp_no" int   NOT NULL,
    "salary" int   NOT NULL,
    "from_date" varchar(10)   NOT NULL,
    "to_date" varchar(10)   NOT NULL,
    CONSTRAINT "pk_Salaries" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Titles" (
    "id" serial   NOT NULL,
    "emp_no" int   NOT NULL,
    "title" varchar   NOT NULL,
    "from_date" varchar(10)   NOT NULL,
    "to_date" varchar(10)   NOT NULL,
    CONSTRAINT "pk_Titles" PRIMARY KEY (
        "id"
     )
);

ALTER TABLE "DeptEmployees" ADD CONSTRAINT "fk_DeptEmployees_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

ALTER TABLE "DeptEmployees" ADD CONSTRAINT "fk_DeptEmployees_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Departments" ("dept_no");

ALTER TABLE "DeptManager" ADD CONSTRAINT "fk_DeptManager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Departments" ("dept_no");

ALTER TABLE "DeptManager" ADD CONSTRAINT "fk_DeptManager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

ALTER TABLE "Salaries" ADD CONSTRAINT "fk_Salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

ALTER TABLE "Titles" ADD CONSTRAINT "fk_Titles_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

