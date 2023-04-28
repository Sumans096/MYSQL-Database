CREATE DATABASE PROJ_ZOMATO;
USE PROJ_ZOMATO;


CREATE TABLE GOLDUSERS_SIGNUP
( USER_ID INT, GOLD_SIGNUP_DATE DATE);

INSERT INTO GOLDUSERS_SIGNUP
VALUES(1,'09-22-2017'),(3,'04-21-2017');


CREATE TABLE PRODUCT
(PRODUCT_ID INT, PRODUCT_NAME TEXT, PRICE INT);

INSERT INTO PRODUCT
VALUES(1,'p1',980),(2,'p2',870), (3,'p3',330);

CREATE TABLE USERS
(USER_ID INT, SIGN_UP_DATE DATE);

INSERT INTO USERS
VALUES(1,'09-02-2014'), (2,'01-15-2015'), (3,'04-11-2014');

CREATE TABLE SALES
(USER_ID INT, CREATED_DATE DATE, PRODUCT_ID INT);

INSERT INTO SALES
VALUES(1,'04-19-2017',2),
(3,'12-18-2019',1),
(2,'07-20-2020',3),
(1,'10-23-2019',2),
(1,'03-19-2018',3),
(3,'12-20-2016',2),
(1,'11-09-2016',1),
(1,'05-20-2016',3),
(2,'09-24-2017',1),
(1,'03-11-2017',2),
(1,'03-11-2016',1),
(3,'11-10-2016',1),
(3,'12-07-2017',2),
(3,'12-15-2016',2),
(2,'11-08-2017',2),
(2,'09-10-2018',3);




SELECT * FROM SALES;
SELECT * FROM PRODUCT;
SELECT * FROM GOLDUSERS_SIGNUP;
SELECT * FROM USERS;


# 1- what is the total amount each customer spent on zomato?

SELECT A.USER_ID, SUM(B.PRICE) Total_Amt_spent FROM SALES A
INNER JOIN 
PRODUCT B ON A.PRODUCT_ID = B.PRODUCT_ID 
GROUP BY A.USER_ID;

# 2- how many days each customer visited on zomato?  

SELECT USER_ID, COUNT(DISTINCT CREATED_DATE) FROM SALES GROUP BY USER_ID;

# 3- what was the first product purchased by each customer of zomato?

SELECT * FROM
(SELECT *, RANK() OVER ( PARTITION BY USER_ID ORDER BY CREATED_DATE ) RANK FROM SALES) 
A WHERE RANK = 1;

# 4- what is the most purchase item on the menu ? 
    
SELECT TOP 2 PRODUCT_ID FROM SALES
GROUP BY PRODUCT_ID
ORDER BY COUNT(PRODUCT_ID) DESC;

# 5- how many times that most selling item purchased by all customers?

SELECT * FROM SALES
WHERE PRODUCT_ID = 
(SELECT TOP 1 PRODUCT_ID FROM SALES 
GROUP BY PRODUCT_ID
ORDER BY COUNT(PRODUCT_ID) DESC);

# 6- which user_id purchased top most selling product?

SELECT USER_ID, COUNT(PRODUCT_ID) P_CNT FROM SALES
WHERE PRODUCT_ID = 
(SELECT TOP 1 PRODUCT_ID FROM SALES
GROUP BY PRODUCT_ID
ORDER BY COUNT(PRODUCT_ID) DESC)
GROUP BY USER_ID;


# 7- which item was most popular for each customer?

SELECT * FROM
(SELECT *, RANK() OVER (PARTITION BY USER_ID 
ORDER BY PURCHASE_CNT DESC) RNK FROM
(SELECT USER_ID,PRODUCT_ID, COUNT(PRODUCT_ID) PURCHASE_CNT FROM SALES   
GROUP BY USER_ID, PRODUCT_ID) A)B 

WHERE RNK = 2;
