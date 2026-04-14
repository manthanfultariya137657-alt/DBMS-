CREATE TABLE BANK_BRANCH (
    BRANCH_ID        VARCHAR2(10),
    BRANCH_NAME      VARCHAR2(20),
    BRANCH_ADDRESS   VARCHAR2(30),
    BRANCH_CITY      VARCHAR2(20),
    BRANCH_STATE     VARCHAR2(20),
    BRANCH_OPEN_DATE DATE
);
 
-- ─── INSERT DATA ─────────────────────────────────────────────
 
INSERT INTO BANK_BRANCH VALUES ('B001','BOI',     'JagnathRoad', 'Rajkot',    'Gujarat',     TO_DATE('22-MAR-2015','DD-MON-YYYY'));
INSERT INTO BANK_BRANCH VALUES ('B002','SBI',     'Boriwali Road','Mumbai',   'Maharashtra', TO_DATE('12-JAN-2000','DD-MON-YYYY'));
INSERT INTO BANK_BRANCH VALUES ('B003','HDFC',    'AgraRoad',    'Agra',      'U.P',         TO_DATE('04-FEB-1998','DD-MON-YYYY'));
INSERT INTO BANK_BRANCH VALUES ('B004','DenaBank','CGRoad',      'Ahmedabad', 'Gujarat',     TO_DATE('20-SEP-2012','DD-MON-YYYY'));
INSERT INTO BANK_BRANCH VALUES ('B005','ICICI',   'MajavdiRoad', 'Junagadh',  'Gujarat',     TO_DATE('07-MAY-2011','DD-MON-YYYY'));
 
COMMIT;
 
-- ─── QUERIES (Practical 5) ────────────────────────────────────
 
-- Q3. All information
SELECT * FROM BANK_BRANCH;
 
-- Q4. Branch_id only
SELECT BRANCH_ID FROM BANK_BRANCH;
 
-- Q5. Branch_id and Branch_address
SELECT BRANCH_ID, BRANCH_ADDRESS FROM BANK_BRANCH;
 
-- Q6. Branch_name, Branch_address, Branch_city
SELECT BRANCH_NAME, BRANCH_ADDRESS, BRANCH_CITY FROM BANK_BRANCH;
 
-- Q7. Branch_city, Branch_state, Branch_open_date
SELECT BRANCH_CITY, BRANCH_STATE, BRANCH_OPEN_DATE FROM BANK_BRANCH;
 
-- Q8. Sort by Branch_id
SELECT * FROM BANK_BRANCH ORDER BY BRANCH_ID;
 
-- Q9. Sort by Branch_name
SELECT * FROM BANK_BRANCH ORDER BY BRANCH_NAME;
 
-- Q10. Sort by Branch_city
SELECT * FROM BANK_BRANCH ORDER BY BRANCH_CITY;
 
-- Q11. Sort by Branch_state
SELECT * FROM BANK_BRANCH ORDER BY BRANCH_STATE;
-- Q12. Change size of Branch_state column
ALTER TABLE BANK_BRANCH MODIFY (BRANCH_STATE VARCHAR2(30));
 
-- Q13. Change branch_name = 'Union' where id = 'B003'
UPDATE BANK_BRANCH SET BRANCH_NAME = 'Union' WHERE BRANCH_ID = 'B003';
COMMIT;
 
-- Q14. Change state = 'Delhi' for BOI branch
UPDATE BANK_BRANCH SET BRANCH_STATE = 'Delhi' WHERE BRANCH_NAME = 'BOI';
COMMIT;
 
-- Q15. Change branch_open_date of Union branch
UPDATE BANK_BRANCH SET BRANCH_OPEN_DATE = TO_DATE('04-NOV-2015','DD-MON-YYYY') WHERE BRANCH_NAME = 'Union';
COMMIT;
 
-- Q16. Add Pincode column
ALTER TABLE BANK_BRANCH ADD (PINCODE NUMBER(6));
 
-- Q17. Insert pincode 360006 for Dena Bank
UPDATE BANK_BRANCH SET PINCODE = 360006 WHERE BRANCH_NAME = 'DenaBank';
COMMIT;
 
-- Q18. Delete branch with open_date = 07-may-2011
DELETE FROM BANK_BRANCH WHERE BRANCH_OPEN_DATE = TO_DATE('07-MAY-2011','DD-MON-YYYY');
COMMIT;
 
-- Q19. Rename table
RENAME BANK_BRANCH TO BRANCH_MASTER;
 
-- Q20. Display structure
DESC BRANCH_MASTER;
 
-- Q21. Create Branch_info from Branch_master
CREATE TABLE BRANCH_INFO AS SELECT * FROM BRANCH_MASTER;