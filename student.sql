CREATE DATABASE STUDENT;

USE STUDENT;

CREATE TABLE STUDENT_INFO(ID VARCHAR(36), ROLL_NO INT, NAME VARCHAR(20), CGPA DOUBLE,LOCATION VARCHAR(20));

INSERT INTO STUDENT_INFO VALUES(UUID(),1,'ABC',9.52,'MUMBAI');
INSERT INTO STUDENT_INFO VALUES(UUID(),2,'DEF',9.5,'NAVI-MUMBAI');
INSERT INTO STUDENT_INFO VALUES(UUID(),3,'GHI',8.2,'MUMBAI');
INSERT INTO STUDENT_INFO VALUES(UUID(),4,'MNO',10.0,'NAVI-MUMBAI');

SELECT * FROM STUDENT_INFO;