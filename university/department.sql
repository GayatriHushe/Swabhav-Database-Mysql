USE UNIVERSITY;
CREATE TABLE DEPARTMENT(DID INT, DNAME VARCHAR(10),CID INT, PRIMARY KEY(DID), FOREIGN KEY(CID) REFERENCES COLLEGE(CID));
INSERT INTO DEPARTMENT(DID, DNAME, CID) VALUES(1,'COMPS',1),(2,'IT',2);
SELECT * FROM DEPARTMENT;