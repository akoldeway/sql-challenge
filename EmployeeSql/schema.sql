-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/1JWI5e
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "departments" (
    "department_id" VARCHAR(25)   NOT NULL,
    "department_name" VARCHAR(255)   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "department_id"
     )
);

CREATE TABLE "employees" (
    "employee_id" INT   NOT NULL,
    "birth_date" DATE   NOT NULL,
    "first_name" VARCHAR(255)   NOT NULL,
    "last_name" VARCHAR(255)   NOT NULL,
    "gender" VARCHAR(1)   NOT NULL,
    "hire_date" DATE   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "employee_id"
     )
);

CREATE TABLE "department_employee" (
    "department_employee_id" SERIAL   NOT NULL,
    "employee_id" INT   NOT NULL,
    "department_id" VARCHAR(25)   NOT NULL,
    "from_date" DATE   NOT NULL,
    "to_date" DATE   NOT NULL,
    CONSTRAINT "pk_department_employee" PRIMARY KEY (
        "department_employee_id"
     )
);

CREATE TABLE "department_manager" (
    "department_manager_id" SERIAL   NOT NULL,
    "department_id" VARCHAR(25)   NOT NULL,
    "employee_id" INT   NOT NULL,
    "from_date" DATE   NOT NULL,
    "to_date" DATE   NOT NULL,
    CONSTRAINT "pk_department_manager" PRIMARY KEY (
        "department_manager_id"
     )
);

CREATE TABLE "salaries" (
    "salary_id" SERIAL   NOT NULL,
    "employee_id" INT   NOT NULL,
    "salary" FLOAT   NOT NULL,
    "from_date" DATE   NOT NULL,
    "to_date" DATE   NOT NULL,
    CONSTRAINT "pk_salaries" PRIMARY KEY (
        "salary_id"
     )
);

CREATE TABLE "titles" (
    "title_id" SERIAL   NOT NULL,
    "employee_id" INT   NOT NULL,
    "title" VARCHAR(255)   NOT NULL,
    "from_date" DATE   NOT NULL,
    "to_date" DATE   NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "title_id"
     )
);

ALTER TABLE "department_employee" ADD CONSTRAINT "fk_department_employee_employee_id" FOREIGN KEY("employee_id")
REFERENCES "employees" ("employee_id");

ALTER TABLE "department_employee" ADD CONSTRAINT "fk_department_employee_department_id" FOREIGN KEY("department_id")
REFERENCES "departments" ("department_id");

ALTER TABLE "department_manager" ADD CONSTRAINT "fk_department_manager_department_id" FOREIGN KEY("department_id")
REFERENCES "departments" ("department_id");

ALTER TABLE "department_manager" ADD CONSTRAINT "fk_department_manager_employee_id" FOREIGN KEY("employee_id")
REFERENCES "employees" ("employee_id");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_employee_id" FOREIGN KEY("employee_id")
REFERENCES "employees" ("employee_id");

ALTER TABLE "titles" ADD CONSTRAINT "fk_titles_employee_id" FOREIGN KEY("employee_id")
REFERENCES "employees" ("employee_id");

