DROP DATABASE IF EXISTS ORG;
SHOW DATABASES;
CREATE DATABASE ORG;
USE ORG;

CREATE TABLE WORKER (
    WORKER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    FIRST_NAME varchar(25),
    LAST_NAME varchar(25),
    SALARY INT(15),
    JOINING_DATE DATETIME,
    DEPARTMENT varchar(25)
);
INSERT INTO WORKER (WORKER_ID,FIRST_NAME,LAST_NAME,SALARY,JOINING_DATE,DEPARTMENT) VALUES
 (001,'Monika','Arora', 100000,'14-02-20 09.00.00', 'HR'),
 (002,'Niharika','Verma', 800000,'14-06-11 09.00.00', 'ADMIN'),
 (003,'Vishal','Singhal', 300000,'14-02-20 09.00.00', 'HR'),
 (004,'Amitabh','Singh', 500000,'14-02-20 09.00.00', 'Admin'),
 (005,'Vivek','Bhati', 500000,'14-06-11 09.00.00', 'ADMIN'),
 (006,'Vipul','Diwan', 200000,'14-06-11 09.00.00', 'Account'),
 (007,'Satish','Kumar', 75000,'14-01-20 09.00.00', 'ACCOUNT'),
 (008,'Geetika','Chauhan', 90000,'14-04-11 09.00.00', 'ADMIN');
 
 ALTER TABLE WORKER ADD FOREIGN KEY (WORKER_REF_ID) REFERENCES BONUS (WORKER_REF_ID);
 
 CREATE TABLE BONUS(
     WORKER_REF_ID INT,
     BONUS_AMOUNT INT(10),
     BONUS_DATE DATETIME,
     FOREIGN KEY(WORKER_REF_ID)
				REFERENCES WORKER(WORKER_ID)
	 ON DELETE CASCADE
);

INSERT INTO BONUS 
	(WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
		(001, 5000, '16-02-20'),
		(002, 3000, '16-06-11'),
		(003, 4000, '16-02-20'),
		(001, 4500, '16-02-20'),
		(002, 3500, '16-06-11');


CREATE TABLE Title (
	WORKER_REF_ID INT,
	WORKER_TITLE CHAR(25),
	AFFECTED_FROM DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

INSERT INTO Title 
	(WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
 (001, 'Manager', '2016-02-20 00:00:00'),
 (002, 'Executive', '2016-06-11 00:00:00'),
 (008, 'Executive', '2016-06-11 00:00:00'),
 (005, 'Manager', '2016-06-11 00:00:00'),
 (004, 'Asst. Manager', '2016-06-11 00:00:00'),
 (007, 'Executive', '2016-06-11 00:00:00'),
 (006, 'Lead', '2016-06-11 00:00:00'),
 (003, 'Lead', '2016-06-11 00:00:00');
 
 show tables;
 
 SELECT * FROM WORKER;
 SELECT * FROM BONUS;
 SELECT * FROM Title;
 
 # Q1)  WRITE A SQL QUERY TO FETCH FIRST NAME USING ALIAS
 SELECT FIRST_NAME AS WORKER_NAME FROM WORKER;
 
 # Q2)  WRITE A SQL QUERY TO FETCH FIRST NAME USING UPPER CASE
 SELECT UPPER(CONCAT(FIRST_NAME,' ',LAST_NAME))AS NAME1 
 FROM WORKER;
 
 # Q3) WRITE A SQL QUERY TO FETCH UNIQUE VALUES FROM DEPARTMENT
  SELECT * FROM WORKER;
  SELECT DISTINCT(DEPARTMENT),SALARYAZ
  FROM WORKER
  GROUP BY FIRST_NAME
  HAVING SUM(SALARY)<70000
  ORDER BY WORKER_ID;
 
 #4) PRINT FIRST 3 CHAR
 
 SELECT SUBSTRING(FIRST_NAME,1,3) AS NAME1 FROM WORKER;
 
 #5)POSITION OG CHARACYER
 
 SELECT instr(FIRST_NAME, BINARY 'A') 
 FROM WORKER
 WHERE FIRST_NAME='Amitabh';
 
#6)SELECT REMOB=VING WHITE SPACE FROM 

SELECT rtrim(FIRST_NAME) FROM WORKER;

#7) REMOVE WHITE SPACE 

SELECT LTRIM(DEPARTMENT) FROM WORKER;

#8) PRINT UNIQUE VALUES COUNT

SELECT DISTINCT LENGTH(DEPARTMENT) FROM WORKER;

#9) WRITE AN SQL QUERY TO PRINT THE FIRST NAME FROM WORKER TABLE REPLACE 'a' with 'A'

select REPLACE(FIRST_NAME, 'n','N') from worker;

#10) write the sql query to print the first_name and lst name from worker table 

SELECT CONCAT(FIRST_NAME,' ',LAST_NAME) FROM WORKER;

#Q-11. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending.
       
        SELECT * FROM WORKER 
        ORDER BY FIRST_NAME ASC;
        
#Q-12. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending and DEPARTMENT Descending.

        SELECT * FROM WORKER
        ORDER BY FIRST_NAME AND DEPARTMENT DESC;
        
#Q-13. Write an SQL query to print details for Workers with the first name as “Vipul” and “Satish” from Worker table.

       SELECT * FROM WORKER
       WHERE FIRST_NAME IN ('VIPUL','SATISH');
#Q-14. Write an SQL query to print details of workers excluding first names, “Vipul” and “Satish” from Worker table.
	   
       SELECT * FROM WORKER
       WHERE FIRST_NAME NOT IN('VIPUL','SATISH');
#Q-15. Write an SQL query to print details of Workers with DEPARTMENT name as “Admin”.

	   SELECT * FROM WORKER
       WHERE DEPARTMENT = 'ADMIN';
        #OR
       SELECT * FROM WORKER
       WHERE DEPARTMENT LIKE "ADMIN%";
#Q-16. Write an SQL query to print details of the Workers whose FIRST_NAME contains ‘a’.

       SELECT * FROM WORKER
       WHERE FIRST_NAME LIKE "%A%";
       
#Q-17. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘a’.

       SELECT * FROM WORKER 
       WHERE FIRST_NAME  LIKE "%A";
       #OR
       SELECT * FROM WORKER 
       WHERE FIRST_NAME NOT LIKE "%A";
       
#Q-18. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets.

       SELECT * FROM WORKER
       WHERE FIRST_NAME LIKE "_____H";
       
#Q-19. Write an SQL query to print details of the Workers whose SALARY lies between 100000 and 500000

        SELECT * FROM WORKER 
        WHERE SALARY BETWEEN 100000 AND 500000;
        
#Q-20. Write an SQL query to print details of the Workers who have joined in Feb’2014.

      SELECT * FROM WORKER
      WHERE YEAR(JOINING_DATE)=2014 AND month(JOINING_DATE)=2;
      
#Q-21. Write an SQL query to fetch the count of employees working in the department ‘Admin’.

       SELECT * FROM WORKER
       WHERE DEPARTMENT LIKE 'ADMIN'
       HAVING COUNT(WORKER_ID);
       
       #or
       select count(*) from worker
       where department ='ADMIN';
       
#Q-22. Write an SQL query to fetch worker names with salaries >= 50000 and <= 100000.
	SELECT * FROM WORKER;
       SELECT W.FIRST_NAME AS NAME, W.DEPARTMENT AS DEPARTMENT, MIN(SALARY) AS SALARY FROM WORKER W
       WHERE SALARY>=50000 AND SALARY<=100000;
       
       SELECT CONCAT(FIRST_NAME," ",LAST_NAME) AS WORKER_NAMES FROM WORKER WHERE WORKER_ID IN (SELECT WORKER_ID FROM WORKER
       WHERE SALARY BETWEEN 50000 AND 100000);
       
#Q-23. Write an SQL query to fetch the no. of workers for each department in the descending order.
      
      SELECT DISTINCT DEPARTMENT FROM WORKER;
      
      SELECT CONCAT(FIRST_NAME,' ',LAST_NAME) AS FULLNAME FROM WORKER
      WHERE DEPARTMENT IN('HR','ADMIN','ACCOUNT')
      ORDER BY DEPARTMENT DESC;
      
	  #OR
	   SELECT DEPARTMENT, COUNT(WORKER_ID) 'no_OF_WORKER'
       FROM WORKER
       GROUP BY DEPARTMENT
       ORDER BY no_OF_WORKER DESC;
       
      SELECT UPPER(FIRST_NAME) FROM WORKER;       
#Q-24. Write an SQL query to print details of the Workers who are also Managers.
	   SHOW TABLES;
       SELECT* FROM WORKER;
       select* from BONUS;
       SELECT * FROM TITLE;
       SELECT WORKER_ID, CONCAT(FIRST_NAME," ",LAST_NAME) AS FULLNAME,SALARY,DEPARTMENT,T.WORKER_TITLE 
       from worker W inner join TITLE T ON T.WORKER_REF_ID=W.WORKER_ID
       WHERE T.WORKER_TITLE IN ('MANAGER','ASST. MANAGER') ;
#Q-25. Write an SQL query to fetch duplicate records having matching data in some fields of a table.
	
       SELECT WORKER_TITLE, AFFECTED_FROM 
       FROM TITLE;
       
       SELECT WORKER_TITLE, AFFECTED_FROM 
       FROM TITLE
       GROUP BY WORKER_TITLE, AFFECTED_FROM 
       HAVING COUNT(*)>1;

#Q-26. Write an SQL query to show only odd rows from a table.
       SELECT * FROM WORKER 
       WHERE MOD(WORKER_ID,2)<>0;
#Q-27. Write an SQL query to show only even rows from a table.

	   SELECT * FROM WORKER
       WHERE MOD(WORKER_ID,2)=0;
#Q-28. Write an SQL query to clone a new table from another table.

       CREATE VIEW EMPLOYEE AS (SELECT * FROM WORKER);
       SELECT * FROM EMPLOYEE;
       #OR
       CREATE TABLE WORKERCLONE LIKE WORKER;
       SHOW TABLES;
#Q-29. Write an SQL query to fetch intersecting records of two tables.
       
       ALTER TABLE TITLE
       ADD COLUMN DEPARTMENT VARCHAR(25);
       INSERT INTO TITLE(DEPARTMENT) VALUES('HR'),
       ('ADMIN'),
       ('ADMIN'),
       ('ADMIN'),
       ('HR'),
       ('ACCOUNT'),
       ('LEAD');
       
       SELECT W. WORKER_ID FROM WORKER W
       INTERSECT
       SELECT T.WORKER_REF_ID FROM TITLE T; 
       
       #OR
       SELECT * FROM WORKER;
       SELECT DISTINCT SALARY FROM  WORKER;
#Q-30. Write an SQL query to show records from one table that another table does not have.

       SELECT * FROM WORKER
       MINUS
       SELECT * FROM TITLE;
       
#Q-31. Write an SQL query to show the current date and time.
 
       SELECT CURDATE();
       SELECT NOW();
       
#Q-32. Write an SQL query to show the top n (say 10) records of a table.

  SELECT * FROM WORKER
  ORDER BY SALARY DESC
  LIMIT 3;
  
#Q-33. Write an SQL query to determine the nth (say n=5) highest salary from a table.
         
        select * from worker; 
        SELECT SALARY FROM WORKER ORDER BY SALARY asc LIMIT 6,1;
#Q-34. Write an SQL query to determine the 5th highest salary without using TOP or limit method.

        SELECT SALARY 
        FROM WORKER W1
        WHERE 4=(SELECT COUNT(DISTINCT(W2.SALARY))
        FROM WORKER W2
        WHERE W2.SALARY>=W1.SALARY);
        
#Q-35. Write an SQL query to fetch the list of employees with the same salary
       SELECT * FROM WORKER;
	   SELECT DISTINCT (WORKER_ID),FIRST_NAME,LAST_NAME,SALARY
       FROM WORKER W
       WHERE W.SALARY IN
       (SELECT W.SALARY 
       FROM WORKER W1
       WHERE W1.SALARY=W.SALARY );
       
       #OR
       
       SELECT DISTINCT W.WORKER_ID,W.FIRST_NAME,W.LAST_NAME,W.SALARY
       FROM WORKER W,WORKER W1
       WHERE W.SALARY=W1.SALARY
       AND W.WORKER_ID!=W1.WORKER_ID;
       
       SELECT DISTINCT W.WORKER_ID,W.FIRST_NAME,W.LAST_NAME,W.SALARY
       FROM WORKER W,WORKER W1
       WHERE W.SALARY=W1.SALARY
       AND W.WORKER_ID<>W1.WORKER_ID;
#Q-36. Write an SQL query to show the second highest salary from a table.
       
       SELECT * FROM WORKER;
       SELECT MAX(SALARY) FROM WORKER;
       
       SELECT MAX(SALARY) FROM WORKER
       WHERE SALARY <
       (SELECT MAX(SALARY) FROM WORKER);
       
       SELECT MAX(SALARY) FROM WORKER
       WHERE SALARY NOT IN
       (SELECT MAX(SALARY) FROM WORKER);
       
       
#Q-37. Write an SQL query to show one row twice in results from a table.

        SELECT FIRST_NAME,DEPARTMENT 
        FROM WORKER W
        WHERE W.DEPARTMENT ='HR'
        UNION ALL
        SELECT FIRST_NAME,DEPARTMENT
        FROM WORKER W1
        WHERE W1.DEPARTMENT='HR';
        
        SELECT W.FIRST_NAME,W.DEPARTMENT 
        FROM WORKER W
        UNION ALL
        SELECT W1.FIRST_NAME,W1.DEPARTMENT 
        FROM WORKER W1;
#Q-38. Write an SQL query to fetch intersecting records of two tables.

        SHOW TABLES;
        CREATE TABLE WORKERCLONE LIKE WORKER;
        CREATE VIEW WORKERCLONE AS (SELECT * FROM WORKER);
        SELECT * FROM WORKER;
        SELECT * FROM WORKERCLONE;
        
        (SELECT W.WORKER_ID FROM WORKER W)
        INTERSECT
        (SELECT W1.WORKER_ID FROM WORKERCLONE W1);
        
#Q-39. Write an SQL query to fetch the first 50% records from a table.

       SELECT * FROM WORKER
       WHERE WORKER_ID <= (SELECT COUNT(WORKER_ID)/2 FROM WORKER);
       
       SELECT COUNT(WORKER_ID)/2 FROM WORKER;
       
#Q-40. Write an SQL query to fetch the departments that have less than five people in it.

       SELECT WORKER.DEPARTMENT,COUNT(WORKER_ID) AS 'NUMBER OF WORKER' 
       FROM WORKER
       GROUP BY DEPARTMENT
       HAVING COUNT(WORKER_ID)<5;
       
#Q-41. Write an SQL query to show all departments along with the number of people in there.
      
       SELECT DEPARTMENT, COUNT(DEPARTMENT) AS 'NUMBER OF WORKER'
       FROM WORKER
       GROUP BY DEPARTMENT;
#Q-42. Write an SQL query to show the last record from a table.


      SELECT * FROM WORKER
      ORDER BY DEPARTMENT DESC LIMIT 1;
      
      SELECT  * FROM WORKER 
      WHERE WORKER_ID=(SELECT MAX(WORKER_ID) FROM WORKER);
      
#Q-43. Write an SQL query to fetch the first row of a table.
       SELECT  * FROM WORKER 
	   WHERE WORKER_ID=(SELECT MIN(WORKER_ID) FROM WORKER);
#Q-44. Write an SQL query to fetch the last five records from a table.

	    SELECT * FROM WORKER
        WHERE WORKER_ID LIMIT 4,8;
        #OR
        
        SELECT * FROM WORKER
        WHERE WORKER_ID >=5
        UNION
        SELECT * FROM (SELECT * FROM WORKER W ORDER BY W.WORKER_ID DESC) AS W1 WHERE W1.WORKER_ID >=5;
        
#Q-45. Write an SQL query to print the name of employees having the highest salary in each department.

	SELECT CONCAT(FIRST_NAME," ",LAST_NAME) AS FULL_NAME,SALARY
    FROM WORKER  
    HAVING SALARY=MAX(SALARY);
    
    SELECT T.DEPARTMENT, T.FIRST_NAME, T.SALARY 
    FROM (SELECT MAX(SALARY) AS TOTAL_SALARY, DEPARTMENT
           FROM WORKER
		   GROUP BY DEPARTMENT) AS TEMPNEW
	INNER JOIN WORKER T ON TEMPNEW.DEPARTMENT=T.DEPARTMENT AND TEMPNEW.TOTAL_SALARY=T.SALARY;
            
#Q-46. Write an SQL query to fetch three max salaries from a table.

        SELECT DISTINCT SALARY FROM WORKER A 
        WHERE 3 >= (SELECT COUNT(DISTINCT SALARY) FROM WORKER B WHERE A.SALARY<=B.SALARY) ORDER BY A.SALARY DESC;
        
#Q-47. Write an SQL query to fetch three min salaries from a table.

		SELECT DISTINCT SALARY FROM WORKER A 
        WHERE 3 >= (SELECT COUNT(DISTINCT SALARY) FROM WORKER B WHERE A.SALARY>=B.SALARY) ORDER BY A.SALARY DESC;
        
#Q-48. Write an SQL query to fetch nth max salaries from a table.
		SELECT DISTINCT SALARY FROM WORKER A 
        WHERE n >= (SELECT COUNT(DISTINCT SALARY) FROM WORKER B WHERE A.SALARY>=B.SALARY) ORDER BY A.SALARY DESC;
        
#Q-49. Write an SQL query to fetch departments along with the total salaries paid for each of them.

		SELECT DEPARTMENT, SUM(SALARY)
        FROM WORKER
        GROUP BY DEPARTMENT;
#Q-50. Write an SQL query to fetch the names of workers who earn the highest salary

       SELECT FIRST_NAME, SALARY FROM WORKER WHERE SALARY=(SELECT MAX(SALARY) FROM WORKER);