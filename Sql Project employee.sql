create database employee;
use  employee;
select EMP_ID,FIRST_NAME,LAST_NAME,GENDER,DEPT FROM emp_record_table;
select EMP_ID,FIRST_NAME,LAST_NAME,GENDER,DEPT,EMP_RATING FROM emp_record_table WHERE EMP_RATING <2 ;
select EMP_ID,FIRST_NAME,LAST_NAME,GENDER,DEPT,EMP_RATING FROM emp_record_table WHERE EMP_RATING > 4 ;
select EMP_ID,FIRST_NAME,LAST_NAME,GENDER,DEPT,EMP_RATING FROM emp_record_table WHERE EMP_RATING between 2 and 4  ;
select concat(FIRST_NAME,'  ' ,LAST_NAME) NAME FROM emp_record_table  where DEPT = 'FINANCE' ;
SELECT
    m.MANAGER_ID,
    GROUP_CONCAT(e.EMP_ID) AS employee_ids,
    COUNT(e.EMP_ID) AS num_reporters
FROM emp_record_table m
JOIN emp_record_table e ON m.MANAGER_ID = e.MANAGER_ID
GROUP BY m.MANAGER_ID;
select * from emp_record_table where DEPT = 'HEALTHCARE'
UNION
select * from emp_record_table where DEPT = 'FINANCE' ;
select  EMP_ID,FIRST_NAME,LAST_NAME, ROLE , DEPT,EMP_RATING ,max(EMP_RATING) OVER (partition by DEPT)
 FROM emp_record_table 
 order by DEPT , EMP_RATING ;
 SELECT   EMP_ID,FIRST_NAME,LAST_NAME, ROLE , DEPT, SALARY,
 min(SALARY)  OVER (partition by ROLE) MIN_SALARY ,
 MAX(SALARY) OVER (partition by ROLE) MAX_SALARY
FROM emp_record_table;
SELECT EMP_ID,FIRST_NAME,LAST_NAME,
EXP , rank () over (order by EXP desc) as rk
from emp_record_table;
select * from  salary ;
select * from emp_record_table
 where EXP IN (select EXP FROM emp_record_table where EXP >10) ;
 call exp_procedure(3) ;
 call emp_p ('JUNIOR DATA SCIENTIST' , 0 , 2) ;
 call emp_p ('ASSOCIATE DATA SCIENTIST' , 2 ,5 );
 call emp_p ('SENIOR DATA SCIENTIST' , 5, 10);
 call emp_p ('LEAD DATA SCIENTIST' , 10, 12 );
 call emp_p ('MANAGER' , 12, 16 );
select *  from emp_record_table where FIRST_NAME = 'Eric' ;
select EMP_ID ,FIRST_NAME ,LAST_NAME , ROLE, EMP_RATING,
SALARY,EMP_RATING*SALARY*0.05 AS BONUS
FROM emp_record_table ;
select EMP_ID ,FIRST_NAME ,LAST_NAME ,
 COUNTRY, CONTINENT , SALARY,
AVG(SALARY) OVER ( partition by COUNTRY ) as AVGcountrysalary,
AVG(SALARY) OVER ( partition by CONTINENT) as AVGcontinentsalary
FROM emp_record_table ;