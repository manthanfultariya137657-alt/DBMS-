-- ─── CREATE TABLES ───────────────────────────────────────────
 
CREATE TABLE JOB (
    JOB_ID   VARCHAR2(10),
    JOB_NAME VARCHAR2(25),
    MIN_SAL  NUMBER(10,2),
    MAX_SAL  NUMBER(10,2)
);
 
CREATE TABLE EMPLOYEE (
    EMP_NO   NUMBER(5),
    EMP_NAME VARCHAR2(15),
    EMP_SAL  NUMBER(10,2),
    EMP_COMM NUMBER(10,2),
    DEPT_NO  NUMBER(5)
);
 
-- Note: DEPOSIT table already created in Practical 1 above.
-- Create a fresh one for this practical with the new data:
CREATE TABLE DEPOSIT2 (
    A_NO   NUMBER(5),
    CNAME  VARCHAR2(15),
    BNAME  VARCHAR2(15),
    AMOUNT NUMBER(10,2),
    ADATE  DATE
);
 
-- ─── INSERT DATA ─────────────────────────────────────────────
 
-- JOB
INSERT INTO JOB VALUES ('IT_PROG', 'Programmer',         4000, 10000);
INSERT INTO JOB VALUES ('MK_MGR',  'Marketing manager',  9000, 15000);
INSERT INTO JOB VALUES ('FI_MGR',  'Finance manager',    8200, 12000);
INSERT INTO JOB VALUES ('FI_ACC',  'Account',            4200,  9000);
INSERT INTO JOB VALUES ('LEC',     'Lecturer',           6000, 17000);
INSERT INTO JOB VALUES ('COMP_OP', 'Computer Operator',  1500,  3000);
 
-- EMPLOYEE
INSERT INTO EMPLOYEE VALUES (101, 'Smith',   800,  NULL,  20);
INSERT INTO EMPLOYEE VALUES (102, 'Snehal',  1600, 300,   25);
INSERT INTO EMPLOYEE VALUES (103, 'Adama',   1100, 0,     20);
INSERT INTO EMPLOYEE VALUES (104, 'Aman',    3000, NULL,  15);
INSERT INTO EMPLOYEE VALUES (105, 'Anita',   5000, 5000,  10);
INSERT INTO EMPLOYEE VALUES (106, 'Sneha',   2450, 2450,  10);
INSERT INTO EMPLOYEE VALUES (107, 'Anamika', 2975, NULL,  30);
 
-- DEPOSIT2
INSERT INTO DEPOSIT2 VALUES (101, 'Anil',  'andheri',   7000, TO_DATE('01-JAN-2006','DD-MON-YYYY'));
INSERT INTO DEPOSIT2 VALUES (102, 'sunil', 'virar',     5000, TO_DATE('15-JUL-2006','DD-MON-YYYY'));
INSERT INTO DEPOSIT2 VALUES (103, 'jay',   'villeparle',6500, TO_DATE('12-MAR-2006','DD-MON-YYYY'));
INSERT INTO DEPOSIT2 VALUES (104, 'vijay', 'andheri',   8000, TO_DATE('17-SEP-2006','DD-MON-YYYY'));
INSERT INTO DEPOSIT2 VALUES (105, 'keyur', 'dadar',     7500, TO_DATE('19-NOV-2006','DD-MON-YYYY'));
INSERT INTO DEPOSIT2 VALUES (106, 'mayur', 'borivali',  5500, TO_DATE('21-DEC-2006','DD-MON-YYYY'));

-- Q1. All data from employee, job and deposit
SELECT * FROM EMPLOYEE;
SELECT * FROM JOB;
SELECT * FROM DEPOSIT2;
 
-- Q2. Account no. and amount for accounts opened between 01-01-06 and 25-07-06
SELECT A_NO, AMOUNT FROM DEPOSIT2
WHERE ADATE BETWEEN TO_DATE('01-JAN-2006','DD-MON-YYYY')
                AND TO_DATE('25-JUL-2006','DD-MON-YYYY');
 
-- Q3. Jobs with min_salary > 4000
SELECT * FROM JOB WHERE MIN_SAL > 4000;
 
-- Q4. Name and salary of employees in dept 20 (with alias)
SELECT EMP_NAME AS "Employee Name", EMP_SAL FROM EMPLOYEE WHERE DEPT_NO = 20;
 
-- Q5. Employee number, name, dept for dept IN (10, 20)
SELECT EMP_NO, EMP_NAME, DEPT_NO FROM EMPLOYEE WHERE DEPT_NO IN (10, 20);
 
-- Q6. Employees whose name starts with 'A'
SELECT * FROM EMPLOYEE WHERE EMP_NAME LIKE 'A%';
 
-- Q7. Employees whose third character is 'a'
SELECT * FROM EMPLOYEE WHERE EMP_NAME LIKE '__a%';
 
-- Q8. Employees whose name starts with 'A' AND third character is 'a'
SELECT * FROM EMPLOYEE WHERE EMP_NAME LIKE 'A_a%';
 
-- Q9. Employees with name 5 characters long and first three chars are 'Ani'
SELECT EMP_NAME, EMP_NO, EMP_SAL FROM EMPLOYEE
WHERE EMP_NAME LIKE 'Ani__';
 
-- Q10. Sort and display customer names from DEPOSIT
SELECT CNAME FROM DEPOSIT ORDER BY CNAME;

-- Q1. Total deposit amount
SELECT SUM(AMOUNT) AS "Total Deposit" FROM DEPOSIT;
 
-- Q2. Total loan from Karolbagh branch
SELECT SUM(AMOUNT) AS "Total Loan Karolbagh"
FROM BORROW WHERE BNAME = 'KAROLBAGH';
 
-- Q3. Maximum loan from VRCE branch
SELECT MAX(AMOUNT) AS "Max Loan VRCE"
FROM BORROW WHERE BNAME = 'VRCE';
 
-- Q4. Total number of customers
SELECT COUNT(*) AS "Total Customers" FROM CUSTOMERS;
 
-- Q5. Total number of distinct customer cities
SELECT COUNT(DISTINCT CITY) AS "Total Cities" FROM CUSTOMERS;
 
-- Q6. Create SUPPLIER from EMPLOYEE with all columns
CREATE TABLE SUPPLIER AS SELECT * FROM EMPLOYEE;
 
-- Q7. Create SUP1 from EMPLOYEE with first two columns
CREATE TABLE SUP1 AS SELECT EMP_NO, EMP_NAME FROM EMPLOYEE;
 
-- Q8. Create SUP2 from EMPLOYEE with no data
CREATE TABLE SUP2 AS SELECT * FROM EMPLOYEE WHERE 1=2;
 
-- Q9. Insert into SUP2: emp name 5 chars, second char = 'n'
INSERT INTO SUP2
SELECT * FROM EMPLOYEE
WHERE LENGTH(EMP_NAME) = 5
  AND SUBSTR(EMP_NAME, 2, 1) = 'n';
COMMIT;
 
-- Q10. Delete all rows from SUP1
DELETE FROM SUP1;
COMMIT;
 
-- Q11. Delete supplier with emp_no = 103 from SUPPLIER
DELETE FROM SUPPLIER WHERE EMP_NO = 103;
COMMIT;
 
-- Q12. Rename SUP2 to SUPLIER_TWO
RENAME SUP2 TO SUPLIER_TWO;
 
-- Q13. Drop SUP1 with all data
DROP TABLE SUP1;
 
-- Q14. Update dept_no = 10 where second character of emp_name is 'm'
UPDATE EMPLOYEE SET DEPT_NO = 10
WHERE SUBSTR(EMP_NAME, 2, 1) = 'm';
COMMIT;
 
-- Q15. Update employee name where emp_no = 103
UPDATE EMPLOYEE SET EMP_NAME = 'Adam'
WHERE EMP_NO = 103;
COMMIT;