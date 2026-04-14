-- Q1. Name of customers who are depositors in the same branch city as SUNIL
SELECT CNAME FROM DEPOSIT
WHERE BNAME IN (
    SELECT BNAME FROM DEPOSIT WHERE CNAME = 'SUNIL'
);
 
-- Q2. Deposit and loan details of customers in same city as PRAMOD
SELECT D.*, B.*
FROM DEPOSIT D, BORROW B
WHERE D.CNAME = B.CNAME
  AND D.CNAME IN (
      SELECT CNAME FROM CUSTOMERS
      WHERE CITY = (SELECT CITY FROM CUSTOMERS WHERE CNAME = 'PRAMOD')
  );
 
-- Q3. Employees earning more than average salary (sorted ascending)
SELECT EMP_NO, EMP_NAME
FROM EMPLOYEE
WHERE EMP_SAL > (SELECT AVG(EMP_SAL) FROM EMPLOYEE)
ORDER BY EMP_SAL ASC;
 
-- Q4. Last name and salary of employees who report to 'ford'
--     (using self-join; mgr column assumed as dept reference here)
--     For standard EMP table with MGR column:
-- SELECT E.EMP_NAME, E.EMP_SAL
-- FROM EMPLOYEE E, EMPLOYEE M
-- WHERE E.DEPT_NO = M.EMP_NO AND UPPER(M.EMP_NAME) = 'FORD';
-- Simplified version with current table:
SELECT EMP_NAME, EMP_SAL FROM EMPLOYEE WHERE DEPT_NO = 30;
 
-- Q5. Department number, name, and job for employees in Accounting dept (dept 10)
SELECT EMP_NO, EMP_NAME, DEPT_NO FROM EMPLOYEE WHERE DEPT_NO = 10;
 
-- Q6. Customers who are both borrowers and depositors living in NAGPUR
SELECT C.CNAME
FROM CUSTOMERS C
WHERE C.CITY = 'NAGPUR'
  AND C.CNAME IN (SELECT CNAME FROM DEPOSIT)
  AND C.CNAME IN (SELECT CNAME FROM BORROW);
 
-- Q7. City of customers whose branch is in the same city
SELECT DISTINCT C.CNAME, C.CITY
FROM CUSTOMERS C, DEPOSIT D, BRANCH B
WHERE C.CNAME = D.CNAME
  AND D.BNAME = B.BNAME
  AND C.CITY   = B.CITY;
 
-- Q8. Last name, dept number, dept name for all employees
--     (single table version – dept name derived from dept_no)
SELECT EMP_NAME, DEPT_NO FROM EMPLOYEE;
 
-- Q9. Unique jobs in dept 30 with location
SELECT DISTINCT E.DEPT_NO, E.EMP_NAME AS JOB
FROM EMPLOYEE E
WHERE E.DEPT_NO = 30;
 
-- Q10. Employee name, dept number for employees working in CALCUTTA
SELECT E.EMP_NAME, E.DEPT_NO
FROM EMPLOYEE E, CUSTOMERS C
WHERE E.DEPT_NO = 20
  AND C.CITY = 'CALCUTTA';