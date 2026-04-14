-- Q1. Add 15 days to current date
SELECT SYSDATE + 15 AS "Date + 15 Days" FROM DUAL;
 
-- Q2. Add and subtract 5 months from current date
SELECT ADD_MONTHS(SYSDATE,  5) AS "Plus 5 Months",
       ADD_MONTHS(SYSDATE, -5) AS "Minus 5 Months"
FROM DUAL;
 
-- Q3. ASCII of 'M'
SELECT ASCII('M') AS "ASCII of M" FROM DUAL;
 
-- Q4. Character equivalent of ASCII 67, 65, 84
SELECT CHR(67) AS "C67", CHR(65) AS "C65", CHR(84) AS "C84" FROM DUAL;
 
-- Q5. Last day of current month
SELECT LAST_DAY(SYSDATE) AS "Last Day of Month" FROM DUAL;
 
-- Q6. Date difference between current date and 20/05/2015
SELECT SYSDATE - TO_DATE('20-05-2015','DD-MM-YYYY') AS "Day Difference" FROM DUAL;
 
-- Q7. Months between current date and 03/03/2016
SELECT MONTHS_BETWEEN(SYSDATE, TO_DATE('03-03-2016','DD-MM-YYYY')) AS "Months Between" FROM DUAL;
 
-- Q8. Second occurrence of 'or' from 3rd position in 'corporate floor'
SELECT INSTR('corporate floor', 'or', 3, 2) AS "2nd Occurrence of or" FROM DUAL;
 
-- Q9. First character of each word in capital in 'marwadi university'
SELECT INITCAP('marwadi university') AS "Initcap Result" FROM DUAL;
 
-- Q10. Current user name and user id
SELECT USER AS "Username", UID AS "User ID" FROM DUAL;
 
 