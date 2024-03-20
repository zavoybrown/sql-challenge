CREATE TABLE IF NOT EXISTS sql_challenge."Departments"
(
    dept_no character varying COLLATE pg_catalog."default" NOT NULL,
    dept_name character varying COLLATE pg_catalog."default",
    CONSTRAINT "Departments_pkey" PRIMARY KEY (dept_no)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS sql_challenge."Departments"
    OWNER to postgres;

CREATE TABLE IF NOT EXISTS sql_challenge.dept_emp
(
    emp_no integer NOT NULL,
    dept_no character varying COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT dept_emp_pkey PRIMARY KEY (emp_no, dept_no)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS sql_challenge.dept_emp
    OWNER to postgres;

CREATE TABLE IF NOT EXISTS sql_challenge.dept_manager
(
    dept_no character varying COLLATE pg_catalog."default" NOT NULL,
    emp_no integer NOT NULL,
    CONSTRAINT dept_manager_dept_no_fkey FOREIGN KEY (dept_no)
        REFERENCES sql_challenge."Departments" (dept_no) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT dept_manager_emp_no_fkey FOREIGN KEY (emp_no)
        REFERENCES sql_challenge.employees (emp_no) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS sql_challenge.dept_manager
    OWNER to postgres;

CREATE TABLE IF NOT EXISTS sql_challenge.employees
(
    emp_no integer NOT NULL,
    emp_title_id character varying COLLATE pg_catalog."default" NOT NULL,
    birth_date date NOT NULL,
    first_name character varying COLLATE pg_catalog."default" NOT NULL,
    last_name character varying COLLATE pg_catalog."default" NOT NULL,
    sex character varying COLLATE pg_catalog."default" NOT NULL,
    hire_date date NOT NULL,
    CONSTRAINT employees_pkey PRIMARY KEY (emp_no),
    CONSTRAINT employees_emp_title_id_fkey FOREIGN KEY (emp_title_id)
        REFERENCES sql_challenge.titles (title_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS sql_challenge.employees
    OWNER to postgres;

CREATE TABLE IF NOT EXISTS sql_challenge.salaries
(
    emp_no integer NOT NULL,
    salary integer NOT NULL,
    CONSTRAINT salaries_emp_no_fkey FOREIGN KEY (emp_no)
        REFERENCES sql_challenge.employees (emp_no) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS sql_challenge.salaries
    OWNER to postgres;

CREATE TABLE IF NOT EXISTS sql_challenge.titles
(
    title_id character varying COLLATE pg_catalog."default" NOT NULL,
    title character varying COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT titles_pkey PRIMARY KEY (title_id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS sql_challenge.titles
    OWNER to postgres;