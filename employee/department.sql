USE EMPLOYEE;
CREATE TABLE DEPARTMENT(DNO INT, DNAME VARCHAR(10),LOCATION VARCHAR(20), PRIMARY KEY(DNO));
INSERT INTO DEPARTMENT(DNO, DNAME, LOCATION) VALUES(10,'SALES','MUMBAI'),(20,'MARKETING','PUNE');
SELECT * FROM DEPARTMENT;