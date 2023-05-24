CREATE DATABASE DEMO;
USE DEMO; 

CREATE TABLE EMP
(SNO INT, NAME VARCHAR(20), EID VARCHAR(6), ADDR VARCHAR(50), CITY VARCHAR(10), PHONE VARCHAR(11), EMAIL_ID VARCHAR(50));

ALTER TABLE EMP
ALTER COLUMN PHONE INT;
 

INSERT INTO EMP(SNO, NAME, EID, ADDR, CITY, PHONE, EMAIL_ID)
VALUES(1, 'Suman', 'E0001', 'Sansar pokhar lahisarai bihar', 'Lakhisarai', 8294446839, 'sumansourabh096@gmail.com');

INSERT INTO EMP(SNO, NAME, EID, ADDR, CITY, PHONE, EMAIL_ID)
VALUES(2, 'Ravi', 'E0002', 'Ashok Nagar,MP', 'Bhopal', 7004507029, 'ravitiwari088@gmail.com');

INSERT INTO EMP
VALUES(3, 'Sourabh', 'E0003', 'Nagavara, karnataka', 'Bangalore', 2346789000, 'saurav.s031996@gmail.com');

INSERT INTO EMP
VALUES(4, 'Shekhar', 'E0004', 'Defence Colony,Mumbai', 'Pune', 6667778880, 'shekhar17.4@gmail.com');

Insert INTO EMP
VALUES(5, 'Manu', 'E0005', 'Rammurthy Nagar, chennai', 'Kerala', 7774443568, 'manugreat@gmail.com');

INSERT INTO EMP
VALUES(6, 'Pawan', 'E0006', 'Gokuldham Nagar, Goregao', 'Delhi', 1112223334, 'pawankhode@gmail.com');

INSERT INTO EMP
VALUES(7, 'Venkat Gopal', 'E0007', 'Muttur', 'Kerela', 2223323453, 'venkatgopal093@gmail.com');

INSERT INTO EMP
VALUES(8, 'Venu Iyyer', 'E0008', 'Rameswaram', 'Tamil Nadu', 2344566789, 'venugpliyr@gmail.com');

INSERT INTO EMP
VALUES(9, 'Parvati', 'E0009', 'Kankarbagh, bihar', 'Patna', 1000380094, 'parvati2242@gmail.com');

INSERT INTO EMP
VALUES(10, 'Priya Singh', 'E0010', 'banka, Bihar', 'Bhagalpur', 1002003004, 'Priy.s03@gmail.com');


SELECT * FROM EMP;





