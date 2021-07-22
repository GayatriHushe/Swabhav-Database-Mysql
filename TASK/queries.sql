USE SWABHAV;
SELECT * FROM EMP;
SELECT * FROM DEPT;

-- 1 => display all employee names in ascending order
SELECT ENAME 
FROM EMP 
ORDER BY ENAME ASC;

-- 2 => display all empname ,salary , commision of employees in dept 10
SELECT ENAME,SAL, COMM 
FROM EMP 
WHERE DEPTNO=10;

-- 3 => display all employees in deptno 20 and 30
SELECT ENAME,SAL, COMM 
FROM EMP 
WHERE DEPTNO IN (20,30);

-- 4 => display all employees who are managers
SELECT * FROM EMP 
WHERE JOB='MANAGER';

-- 5 => display all employees whose salary between 2K to 5k
SELECT * FROM EMP 
WHERE SAL BETWEEN 2000 AND 5000;

-- 6 => diplay all emplyees whose commision is null
SELECT * FROM EMP 
WHERE COMM IS NULL;

-- 7 => display employee name,salary,comm,ctc
SELECT ENAME, SAL, COMM,(12*(COALESCE(COMM, 0 ) +SAL)) AS CTC 
FROM EMP;

-- 8 => display employees avg,max,min,sum of salaries -- descriptive stats
SELECT AVG(SAL) 
FROM EMP;

SELECT MAX(SAL) 
FROM EMP;

SELECT MIN(SAL) 
FROM EMP;

SELECT SUM(SAL) 
FROM EMP;

-- 9 => display hiredate,currentDate,tenure of the employees
SELECT CURDATE();
ALTER TABLE EMP ADD JOINDATE DATE;
UPDATE EMP SET JOINDATE = '1981-11-17' WHERE EMPNO=7839;
UPDATE EMP SET JOINDATE = '1981-05-01' WHERE EMPNO=7698;
UPDATE EMP SET JOINDATE = '1981-06-09' WHERE EMPNO=7782;
UPDATE EMP SET JOINDATE = '1981-04-02' WHERE EMPNO=7566;
UPDATE EMP SET JOINDATE = '1981-09-28' WHERE EMPNO=7654;
UPDATE EMP SET JOINDATE = '1981-02-20' WHERE EMPNO=7499;
UPDATE EMP SET JOINDATE = '1981-09-08' WHERE EMPNO=7844;
UPDATE EMP SET JOINDATE = '1981-12-03' WHERE EMPNO=7900;
UPDATE EMP SET JOINDATE = '1981-02-22' WHERE EMPNO=7521;
UPDATE EMP SET JOINDATE = '1981-12-03' WHERE EMPNO=7902;
UPDATE EMP SET JOINDATE = '1980-12-17' WHERE EMPNO=7369;
UPDATE EMP SET JOINDATE = '1982-12-09' WHERE EMPNO=7788;
UPDATE EMP SET JOINDATE = '1983-01-12' WHERE EMPNO=7876;
UPDATE EMP SET JOINDATE = '1982-01-23' WHERE EMPNO=7934;

SELECT JOINDATE,CURDATE(),(CURDATE() - JOINDATE) AS TENURE FROM EMP;

-- 10 => display all employees whose name start with 'S'
SELECT * FROM EMP WHERE ENAME LIKE 'S%';

-- 11 => display unique deptno from emp table
SELECT DISTINCT(DEPTNO) FROM EMP;

-- 12 => display job in lower case
SELECT LOWER(JOB) FROM EMP;

-- 13 => select top 3 salary earning employees
SELECT X.ENAME , X.SAL from EMP X where 3 > ( select count(distinct Y.SAL) from EMP Y where Y.SAL > X.SAL );

-- 14 => select all ClERKS and Managers in dept 10
SELECT * FROM EMP WHERE JOB IN ('CLERK','MANAGER');

-- 15 => Display all clerks in ascending order of deptno
SELECT * FROM EMP WHERE JOB='CLERK' ORDER BY DEPTNO ASC;

-- 16 => Display All employees in the same dept of 'SCOTT'
SELECT * FROM EMP WHERE DEPTNO = (SELECT DEPTNO FROM EMP WHERE ENAME='SCOTT');

-- 17 => Employees having same designation of SMITH
SELECT * FROM EMP WHERE JOB = (SELECT JOB FROM EMP WHERE ENAME='SMITH');

-- 18 => Employee who are reproting under KING
SELECT * FROM EMP WHERE MGR = (SELECT EMPNO FROM EMP WHERE ENAME='KING');

-- 19 => Employees who have same salary of BLAKE
SELECT * FROM EMP WHERE SAL = (SELECT SAL FROM EMP WHERE ENAME='BLAKE');

-- 20 => Employee name,deptname and location
SELECT ENAME,DNAME,LOC FROM EMP LEFT JOIN DEPT ON EMP.DEPTNO=DEPT.DEPTNO;

-- 21 => display all deptnames and corresponing employees if any
SELECT DNAME,ENAME FROM DEPT LEFT JOIN EMP ON DEPT.DEPTNO=EMP.DEPTNO;

-- 22 => display all deptnames where there are no employees
SELECT DISTINCT(DNAME) FROM DEPT LEFT JOIN EMP ON DEPT.DEPTNO=EMP.DEPTNO WHERE EMP.EMPNO IS NULL;

-- 23 => display all enames and their mangaer names (boss)
SELECT X.ENAME AS BOSS,Y.ENAME FROM EMP X LEFT JOIN EMP Y ON X.EMPNO=Y.MGR;

-- 24 => display all enames,their denames and their manager names ( 3 Tables)
SELECT DISTINCT X.ENAME , DEPT.DNAME , Y.ENAME AS BOSS 
FROM EMP X LEFT JOIN DEPT ON X.DEPTNO=DEPT.DEPTNO LEFT JOIN EMP Y ON X.MGR=Y.EMPNO;


SELECT * FROM REGIONS;
SELECT * FROM COUNTRIES;
SELECT * FROM LOCATION;

-- 25 => Display location name,city name,country name,regition name
SELECT REGION_NAME , COUNTRY_NAME , STREET_ADDRESS AS LOCATION_NAME, LOCATION.CITY 
FROM REGIONS, COUNTRIES, LOCATION 
WHERE (REGIONS.REGION_ID= COUNTRIES.REGION_ID AND COUNTRIES.COUNTRY_ID = LOCATION.COUNTRY_ID);

-- 26 => Display Country where there are no locations availbale in location table
SELECT COUNTRY_NAME,LOCATION_ID 
FROM COUNTRIES LEFT JOIN LOCATION ON COUNTRIES.COUNTRY_ID=LOCATION.COUNTRY_ID 
WHERE LOCATION.STREET_ADDRESS IS NULL;

-- 27 => Display the regions where there are no countries available in country table
SELECT REGION_NAME,COUNTRY_ID FROM REGIONS LEFT JOIN COUNTRIES ON REGIONS.REGION_ID=COUNTRIES.REGION_ID 
WHERE COUNTRIES.COUNTRY_ID IS NULL;

-- 28 => Insert your address and Fetch using join
INSERT INTO LOCATION VALUES(2000,'DR G M BHOSALE MARG',400018,'MUMBAI','MAHARASHTRA','IN');
SELECT LOCATION_ID, STREET_ADDRESS, POSTAL_CODE, CITY, STATE_PROVINCE,LOCATION.COUNTRY_ID,COUNTRIES.COUNTRY_NAME, COUNTRIES.REGION_ID, REGIONS.REGION_NAME 
FROM LOCATION 
LEFT JOIN COUNTRIES ON LOCATION.COUNTRY_ID=COUNTRIES.COUNTRY_ID 
LEFT JOIN REGIONS ON COUNTRIES.REGION_ID=REGIONS.REGION_ID 
WHERE LOCATION_ID=2000;