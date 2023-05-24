CREATE DATABASE Inv_Proj;
use Inv_Proj;





--Q.Make a SUPPLIER TABLE consisting Add_Sup as table Name, SID S001, S_NAME	Not Null, S_ADDR	Not Null, S_CITY take default as DELHI, S_PHONE	Unique,EMAIL.
	

CREATE TABLE ADD_SUP
(S_ID VARCHAR(5) NOT NULL, S_NAME VARCHAR(30) NOT NULL, S_ADDR VARCHAR(30) NOT NULL, S_CITY VARCHAR(10), S_PHONE CHAR(12) UNIQUE, EMAIL VARCHAR(30));

ALTER TABLE ADD_SUP
ADD CONSTRAINT DFLT DEFAULT 'Delhi' FOR S_CITY;

ALTER TABLE ADD_SUP
ADD CONSTRAINT PK_SUP PRIMARY KEY(S_ID);

INSERT INTO ADD_SUP
VALUES('S0001', 'ABC Supplier', '123 main st. bengaluru', 'Bengaluru', '555-654-7345', 'abc@gmail.com'); 

INSERT INTO ADD_SUP
VALUES('S0002', 'XYZ INC.', '456 street circle Lucknow', 'Lucknow', '443-234-7867', 'xyz098@gmail.com'); 

INSERT INTO ADD_SUP(S_ID, S_NAME, S_ADDR, S_PHONE, EMAIL)
VALUES('S0003', 'LMN Comp. Pvt. Ltd', '786 Market st. Delhi', '434-008-0076', 'lmn09@yahoo.com'); 

INSERT INTO ADD_SUP
VALUES('S0004', 'DLF Pvt. Ltd', 'Near hanuman mandir Bhopal', 'Bhopal', '434-008-5564', 'dlf@yahoo.com'); 

INSERT INTO ADD_SUP
VALUES('S0005', 'GHI Product', 'kolar, Indore', 'Indore', '443-234-0092', 'GHI88@gmail.com');

INSERT INTO ADD_SUP
VALUES('S0006', 'NOP Supplier', 'Gitorni,Havra', 'Kolkata', '443-200-7867', 'nop_supp093@gmail.com'); 

INSERT INTO ADD_SUP
VALUES('S0007', 'jindal supplier', 'kankarbagh, Patna', 'Patna', '443-234-3400', 'jindpatna@yahoo.com'); 

INSERT INTO ADD_SUP
VALUES('S0008', 'TATA Industries', 'CIL india pvt ltd Ranchi', 'Ranchi', '443-234-0000', 'tata_ind@gmail.com'); 

INSERT INTO ADD_SUP
VALUES('S0009', 'mahendra pvt ltd', 'Sanchi gorbandar, Ahemdabad', 'Ahemdabad', '443-234-1234', 'mahi.supplier067@yahoo.com'); 

INSERT INTO ADD_SUP
VALUES('S0010', 'Gamp service', 'Gokuldham building,Tamil Nadu ', 'Tamil Nadu', '443-564-2000', 'gamp_ser098@gmail.com');

SELECT * FROM ADD_SUP;







CREATE TABLE ADD_PROD
(P_ID VARCHAR(5) NOT NULL PRIMARY KEY, PDESC VARCHAR(25) NOT NULL, PRICE BIGINT, CATEGORY VARCHAR(25), S_ID VARCHAR(5) NOT NULL);

ALTER TABLE ADD_PROD
ADD CONSTRAINT CKC CHECk (CATEGORY IN ('IT', 'Home Appliance', 'Health Care'));

ALTER TABLE ADD_PROD
ADD CONSTRAINT CKP CHECK (PRICE > 0);

ALTER TABLE ADD_PROD
ADD CONSTRAINT FKID FOREIGN KEY(S_ID) REFERENCES ADD_SUP(S_ID);

 

INSERT INTO ADD_PROD
VALUES('P0001', 'Laptop', 60000, 'IT', 'S0001');

INSERT INTO ADD_PROD
VALUES('P0002', 'Smart TV', 45000, 'Home Appliance', 'S0002');

INSERT INTO ADD_PROD
VALUES('P0003', 'Microwave Oven', 12000, 'Home Appliance', 'S0003');

INSERT INTO ADD_PROD
VALUES('P0004', 'Air Purifier', 8000, 'Health Care', 'S0004');

INSERT INTO ADD_PROD
VALUES('P0005', 'Treadmill', 30000, 'Health Care', 'S0005');

INSERT INTO ADD_PROD
VALUES('P0006', 'Bluetooth Speaker', 4000, 'Home Appliance', 'S0006');

INSERT INTO ADD_PROD
VALUES('P0007', 'Desktop Computer', 45000, 'IT', 'S0007');

INSERT INTO ADD_PROD
VALUES('P0008', 'Refrigerator', 25000, 'Home Appliance', 'S0008');

INSERT INTO ADD_PROD
VALUES('P0009', 'Blood Pressure Monitor', 3500, 'Health Care','S0009');

INSERT INTO ADD_PROD
VALUES('P0010', 'Wi-fi Router', 3000, 'IT', 'S0010');


SELECT * FROM ADD_PROD;



INSERT INTO ADD_PROD
VALUES('P0021', 'Keyboard', -2000, 'IT', 111);



-- SHOW ERROR ON EXECUTION BECAUSE OF VIOLATION OF PRIMARY KEY CONSTRAINT RULE.
INSERT INTO ADD_PROD
VALUES('Keyboard', 2000, 'IT', 111);

INSERT INTO ADD_PROD
VALUES('P0011', 'Keyboard', 2000, 'IT', 'S011');



/* # NOTE: First we will apply primary then we have to apply foreign key like this in below.

ALTER TABLE ADD_SUP
ADD CONSTRAINT PK_ADD_SUP PRIMARY KEY(S_ID);
ALTER TABLE ADD_PROD 
ADD CONSTRAINT FKID FOREIGN KEY(S_ID) REFERENCES ADD_SUP(S_ID);

-- We have to use primary key on parent table column and foreign key on child table column.  
*/




/* 
 # NOTE: Because of foreign key insert into was not executing then by below sql query and by using NOCHECK constraint I temporarily disable the foreign key. 

ALTER TABLE ADD_PROD
NOCHECK CONSTRAINT FKID;

-- # Note: Then after inserting value i again written the sql query below and by using check I again Able the foreign key.

ALTER TABLE ADD_PROD
CHECK CONSTRAINT FKID;

*/






-- Q. Create a stock table with name ADD_STK containing column PID - FK, SQTY >=0, ROL >0, MOQ	>=5.
	
CREATE TABLE ADD_STK
(P_ID VARCHAR(5) NOT NULL, S_QTY INT CHECK(S_QTY >= 0), ROL INT CHECK(ROL > 0), MOQ INT CHECK(MOQ >= 5));


INSERT INTO ADD_STK
VALUES('P0001', 100, 50, 10);

INSERT INTO ADD_STK
VALUES('P0002', 50, 25, 5);

INSERT INTO ADD_STK
VALUES('P0003', 200, 75, 15);

INSERT INTO ADD_STK
VALUES('P0004', 75, 30, 10);

INSERT INTO ADD_STK
VALUES('P0005', 150, 60, 20);

INSERT INTO ADD_STK
VALUES('P0006', 300, 80, 25);

INSERT INTO ADD_STK
VALUES('P0007', 120, 25, 15);

INSERT INTO ADD_STK
VALUES('P0008', 90, 18, 5);

INSERT INTO ADD_STK
VALUES('P0009', 180, 40, 10);

INSERT INTO ADD_STK
VALUES('P0010', 60, 12, 5);

ALTER TABLE ADD_STK
ADD CONSTRAINT FK_STK FOREIGN KEY(P_ID) REFERENCES ADD_PROD(P_ID);

SELECT * FROM ADD_STK;



-- NOTE: Here in p0011,p0012 will not execute because of not satisfying check condition .

INSERT INTO ADD_STK
VALUES('P0011', 100, 20, 3);

INSERT INTO ADD_STK
VALUES('P0012', 100, -5, 50);












/*
Q. Create a CUSTOMER table by name ADD_CUST Containing columns CID, CNAME --NOT NULL, ADDRESS -- NOT NULL, CITY -- NOT NULL, PHONE -- NOT NULL, 
EMAIL -- NOT NULL, DOB -- <1-JAN-2000.
*/



CREATE TABLE ADD_CUST
(C_ID VARCHAR(5) NOT NULL PRIMARY KEY, C_NAME VARCHAR(20) NOT NULL, ADDR VARCHAR(25) NOT NULL, CITY VARCHAR(10) NOT NULL, PHONE BIGINT NOT NULL, EMAIL VARCHAR(30) NOT NULL,
DOB DATE CHECK(DOB < '2000-01-01'));



INSERT INTO ADD_CUST
VALUES('C0001', 'John Smith', '123 Main st.,delhi', 'Delhi', 5553459870, 'johnsmith@ibm.com', '1999-05-09');

INSERT INTO ADD_CUST
VALUES('C0002', 'Jane Doe', '456 2nd Antonio road Goa', 'Goa', 5522875900, 'janedoe88@bling.com', '1990-03-15');

INSERT INTO ADD_CUST
VALUES('C0003', 'Bob Johnson', '786 khicmanglore', 'Mangalore', 5543469070, 'bobmanglore09@yahoo.com', '1988-05-07');

INSERT INTO ADD_CUST
VALUES('C0004', 'Lisa Lee', 'Efl tower St.', 'Paris', 2303453487, 'lisalee93@gmail.com', '1986-10-10');

INSERT INTO ADD_CUST
VALUES('C0005', 'Abhilash Narayan', 'Aayodhiya colony dehradun', 'Dehradun', 9053400871, 'abhilashram09@yahoo.com', '1993-02-14');

INSERT INTO ADD_CUST
VALUES('C0006', 'Simran Deshpandey', 'white lake city,borivali', 'Mumbai', 9003459870, 'simrandpndy@gmail.com', '1994-01-09');

INSERT INTO ADD_CUST
VALUES('C0007', 'Tom Lee', '7th St.Apt.78', 'Atlanta', 1002359870, 'tomlee98@bcg.com', '1992-07-25');

INSERT INTO ADD_CUST
VALUES('C0008', 'Emily Kim', 'St. Antinomario burlin', 'Burlin', 1053459000, 'emilykimbcg@yahoo.com', '1990-03-26');

INSERT INTO ADD_CUST
VALUES('C0009', 'Aman Gupta', 'Maboob studio,Bandra', 'Mumbai', 1053459000, 'emilykimbcg@yahoo.com', '1990-03-26');

INSERT INTO ADD_CUST
VALUES('C0010', 'Darcia', '76th Hollywood St.LAS', 'Los Angels', 6083459870, 'darciaconsulti97@cognizant.com', '1996-08-23');


SELECT * FROM ADD_CUST;













-- Q. Create a Order table containing column like OID--	O0001, ODATE, CID	FK, PID	FK, OQTY--- >=1	and Name the the table ADD_ORD.


Create table ADD_ORD
(O_ID VARCHAR(5) NOT NULL, O_DATE DATE NOT NULL, C_ID VARCHAR(5) NOT NULL, P_ID VARCHAR(5), O_QTY INT NOT NULL);

ALTER TABLE ADD_ORD
ADD CONSTRAINT CKO CHECK(O_QTY >=1);   


/* 
NOTE: DATE can be saved in standard formate but if want to change the formate to dd-mm-yyyy then we have to change by this --
SELECT FORMAT(GETDATE(), 'DD-MM-YYYY');
*/


INSERT INTO ADD_ORD
VALUES('O0001', '06-03-2023', 'C0001', 'P0001', 5);

INSERT INTO ADD_ORD
VALUES('O0002', '2023-02-14', 'C0002', 'P0002', 10);

INSERT INTO ADD_ORD
VALUES('O0003', '2023-01-26', 'C0003', 'P0003', 8);

INSERT INTO ADD_ORD
VALUES('O0004', '2022-11-16', 'C0004', 'P0004', 4);

INSERT INTO ADD_ORD
VALUES('O0005', '2022-08-12', 'C0005', 'P0005', 6);

INSERT INTO ADD_ORD
VALUES('O0006', '2023-03-12', 'C0006', 'P0006', 10);

INSERT INTO ADD_ORD
VALUES('O0007', '2023-03-20', 'C0007', 'P0007', 7);

INSERT INTO ADD_ORD
VALUES('O0008', '2023-04-15', 'C0008', 'P0008', 2);

INSERT INTO ADD_ORD
VALUES('O0009', '2023-05-04', 'C0009', 'P0009', 5);

INSERT INTO ADD_ORD
VALUES('O0010', '2023-05-22', 'C0005', 'P0010', 3);


SELECT * FROM ADD_ORD;


-- This 'O001' will not execute because this is not satisfying the condition i.e O_Qty >= 1.

INSERT INTO ADD_ORD
VALUES('O001', '2020-07-12', 'C11', 'P11', 0);


ALTER TABLE ADD_ORD
ADD CONSTRAINT FKO FOREIGN KEY(C_ID) REFERENCES ADD_CUST(C_ID);


ALTER TABLE ADD_ORD
ADD CONSTRAINT FK_ORD FOREIGN KEY(P_ID) REFERENCES ADD_PROD(P_ID);

SELECT * FROM ADD_ORD;











-- Q. Create table by name BILL contain O_ID, O_ID, O_DATE, C_NAME, ADDR, PHONE, PDESC, O_QTY, AMT as column of table .


CREATE TABLE BILL
(O_ID VARCHAR(5) NOT NULL PRIMARY KEY, O_DATE DATE NOT NULL, C_NAME VARCHAR(25), ADDR VARCHAR(25), PHONE BIGINT NOT NULL, PDESC VARCHAR(25) NOT NULL, O_QTY INT NOT NULL, 
AMT INT NOT NULL);


INSERT INTO BILL(O_ID, O_DATE, C_NAME, ADDR, PHONE, PDESC, O_QTY, AMT)
SELECT ORD.O_ID, ORD.O_DATE, CUST.C_NAME, CUST.ADDR, CUST.PHONE, PROD.PDESC, ORD.O_QTY, (ORD.O_QTY * PROD.PRICE) AS AMT 
FROM
	ADD_ORD AS ORD
	INNER JOIN ADD_CUST AS CUST
	ON ORD.C_ID = CUST.C_ID

	INNER JOIN ADD_PROD AS PROD
	ON ORD.P_ID = PROD.P_ID

	INNER JOIN ADD_SUP AS SUP
	ON SUP.S_ID = PROD.S_ID

	INNER JOIN ADD_STK AS STK
	ON STK.P_ID = PROD.P_ID;

SELECT * FROM BILL;













-- Q. Create PURCHASE table containing P_ID, S_ID, P_QTY, DOP as columns.

CREATE TABLE PURCHASE 
(P_ID VARCHAR(5) NOT NULL PRIMARY KEY, S_ID VARCHAR(5) NOT NULL, P_QTY INT NOT NULL, DOP DATE NOT NULL);

ALTER TABLE PURCHASE
ADD CONSTRAINT FPUR FOREIGN KEY(P_ID) REFERENCES ADD_PROD(P_ID);


ALTER TABLE PURCHASE 
ADD CONSTRAINT FK_PUR FOREIGN KEY(S_ID) REFERENCES ADD_SUP(S_ID);


INSERT INTO PURCHASE(P_ID, S_ID, P_QTY, DOP)
SELECT PROD.P_ID, SUP.S_ID, ORD.O_QTY, ORD.O_DATE
FROM 
	 ADD_ORD AS ORD
	 INNER JOIN ADD_PROD AS PROD 
	 ON ORD.P_ID = PROD.P_ID

	 INNER JOIN ADD_SUP AS SUP
	 ON SUP.S_ID = PROD.S_ID

	 INNER JOIN BILL 
	 ON ORD.O_ID = BILL.O_ID;

SELECT * FROM PURCHASE;






-- Now lets see all table together the results of our queries.

SELECT * FROM ADD_SUP;
SELECT * FROM ADD_PROD;
SELECT * FROM ADD_STK;
SELECT * FROM ADD_CUST;
SELECT * FROM ADD_ORD;
SELECT * FROM BILL;
SELECT * FROM PURCHASE;

