CREATE TABLE CUST_MASTER (
    CUST_NO   VARCHAR2(5),
    CUST_NAME VARCHAR2(20),
    ADDRESS1  VARCHAR2(30),
    ADDRESS2  VARCHAR2(30),
    CITY      VARCHAR2(15),
    STATE     VARCHAR2(15),
    PH_NO     VARCHAR2(15)
);
 
-- ─── INSERT DATA ─────────────────────────────────────────────
 
INSERT INTO CUST_MASTER VALUES ('C1','Priya', 'RingRoad',      'Puja Park',        'Ahmedabad','Gujarat',     '8989878548');
INSERT INTO CUST_MASTER VALUES ('C2','Puja',  'Lajpat Nager',  'Shyamal colony',   'Banaras',  'UP',          '7898456213');
INSERT INTO CUST_MASTER VALUES ('C3','Ankit', 'Borivali',      'Panchayat nager',  'Mumbai',   'Maharashtra', '7885984251');
INSERT INTO CUST_MASTER VALUES ('C4','Ravi',  'VajdiRoad',     'Nandbhoomi colony','Delhi',    'Delhi',       '7898452034');
INSERT INTO CUST_MASTER VALUES ('C5','Alpa',  'Jamanager Road','Railway colony',   'Ahmedabad','Gujarat',     '7465241589');
 
COMMIT;
 
-- ─── QUERIES ─────────────────────────────────────────────────
 
-- Q3. All customers
SELECT * FROM CUST_MASTER;
 
-- Q4. Customers from Gujarat
SELECT * FROM CUST_MASTER WHERE STATE = 'Gujarat';
 
-- Q5. Sort by customer name
SELECT * FROM CUST_MASTER ORDER BY CUST_NAME;
 
-- Q6. Distinct city values
SELECT DISTINCT CITY FROM CUST_MASTER;
 
-- Q7. Update address1 of Priya
UPDATE CUST_MASTER SET ADDRESS1 = 'CG Road' WHERE CUST_NAME = 'Priya';
COMMIT;
 
-- Q8. City of customers from Gujarat
SELECT CITY FROM CUST_MASTER WHERE STATE = 'Gujarat';
 
-- Q9. Add PIN_CODE column
ALTER TABLE CUST_MASTER ADD (PIN_CODE NUMBER(6));
 
-- Q10. Drop PIN_CODE column
ALTER TABLE CUST_MASTER DROP COLUMN PIN_CODE;
 
-- Q11. Delete customer with ph_no = '7898452034'
DELETE FROM CUST_MASTER WHERE PH_NO = '7898452034';
COMMIT;
 
-- Q12. Rename table
RENAME CUST_MASTER TO CUSTOMER_DETAIL;