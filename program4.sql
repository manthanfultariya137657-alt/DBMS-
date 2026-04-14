CREATE TABLE PERSON (
    PERSON_ID NUMBER(5),
    FNAME     VARCHAR2(15),
    LNAME     VARCHAR2(15),
    CITY      VARCHAR2(15),
    SALARY    NUMBER(10,2)
);
 
-- ─── INSERT DATA ─────────────────────────────────────────────
 
INSERT INTO PERSON VALUES (1, 'Sneha',  'Sheth',     'Rajkot',    10000);
INSERT INTO PERSON VALUES (2, 'Puja',   'Parmar',    'Ahmedabad', 2000);
INSERT INTO PERSON VALUES (3, 'Riya',   'Gajar',     'Pune',      8000);
INSERT INTO PERSON VALUES (4, 'Sandip', 'Jadeja',    'Pune',      5000);
INSERT INTO PERSON VALUES (5, 'Alpesh', 'Prajapati', 'Mumbai',    20000);
 
COMMIT;
 
-- ─── QUERIES ─────────────────────────────────────────────────
 
-- Q3. Person_Id and Fname
SELECT PERSON_ID, FNAME FROM PERSON;
 
-- Q4. All persons
SELECT * FROM PERSON;
 
-- Q5. Sort by salary
SELECT * FROM PERSON ORDER BY SALARY;
 
-- Q6. Distinct cities
SELECT DISTINCT CITY FROM PERSON;
 
-- Q7. Update city of Sandip from Pune to Kolkata
UPDATE PERSON SET CITY = 'Kolkata' WHERE FNAME = 'Sandip';
COMMIT;
 
-- Q8. Person with Lname 'Prajapati'
SELECT * FROM PERSON WHERE LNAME = 'Prajapati';
 
-- Q9. Add STATE, BIRTHDATE, PINCODE columns
ALTER TABLE PERSON ADD (STATE VARCHAR2(15), BIRTHDATE DATE, PINCODE NUMBER(6));
 
-- Q10. Person with salary > 6000
SELECT * FROM PERSON WHERE SALARY > 6000;
 
-- Q11. Delete persons with salary < 3000
DELETE FROM PERSON WHERE SALARY < 3000;
COMMIT;
 
-- Q12. Rename table
RENAME PERSON TO PERSON_MASTER;