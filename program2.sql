CREATE TABLE ITEM_MASTER (
    ID             VARCHAR2(5),
    NAME           VARCHAR2(20),
    TYPE           VARCHAR2(15),
    PRICE          NUMBER(10,2),
    QUALITY        VARCHAR2(10),
    ITEM_PACK_DATE DATE
);
 
-- ─── INSERT DATA ─────────────────────────────────────────────
 
INSERT INTO ITEM_MASTER VALUES ('I1', 'Dairymilk',   'Chocolate', 500,  'Good',     TO_DATE('12-AUG-2000','DD-MON-YYYY'));
INSERT INTO ITEM_MASTER VALUES ('I2', 'Kajukatri',   'Mithai',    1000, 'Verygood', TO_DATE('15-JAN-2016','DD-MON-YYYY'));
INSERT INTO ITEM_MASTER VALUES ('I3', 'Pizza',       'Fastfood',  350,  'Average',  TO_DATE('20-FEB-2015','DD-MON-YYYY'));
INSERT INTO ITEM_MASTER VALUES ('I4', 'Orangejuice', 'Juice',     50,   'Best',     TO_DATE('05-FEB-2016','DD-MON-YYYY'));
INSERT INTO ITEM_MASTER VALUES ('I5', 'Vanilla_cack','Bakery',    2000, 'Good',     TO_DATE('01-JAN-2016','DD-MON-YYYY'));
 
COMMIT;
 
-- ─── QUERIES ─────────────────────────────────────────────────
 
-- Q3. Price, quality, item_pack_date
SELECT PRICE, QUALITY, ITEM_PACK_DATE FROM ITEM_MASTER;
 
-- Q4. Display all item information
SELECT * FROM ITEM_MASTER;
 
-- Q5. Sort items by quality
SELECT * FROM ITEM_MASTER ORDER BY QUALITY;
 
-- Q6. Distinct quality values
SELECT DISTINCT QUALITY FROM ITEM_MASTER;
 
-- Q7. Change quality from 'Good' to 'Verygood'
UPDATE ITEM_MASTER SET QUALITY = 'Verygood' WHERE QUALITY = 'Good';
COMMIT;
 
-- Q8. Display items with quality 'Verygood'
SELECT * FROM ITEM_MASTER WHERE QUALITY = 'Verygood';
 
-- Q9. Add new column ITEM_PUR_DATE
ALTER TABLE ITEM_MASTER ADD (ITEM_PUR_DATE DATE);
 
-- Q10. Items with price > 500
SELECT * FROM ITEM_MASTER WHERE PRICE > 500;
 
-- Q11. Delete item with price = 50
DELETE FROM ITEM_MASTER WHERE PRICE = 50;
COMMIT;
 
-- Q12. Rename table (Oracle syntax)
RENAME ITEM_MASTER TO ITEM_DETAIL;