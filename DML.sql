
-- (i)	Add 5 rows in the employee and dept tables

INSERT INTO department VALUES(100,"marketing","kollam");
INSERT INTO department VALUES(101,"accounting","kollam");
INSERT INTO department VALUES(102,"finance","kollam");
INSERT INTO department VALUES(103,"purchasing","kollam");
INSERT INTO department VALUES(104,"sales","kollam");

INSERT INTO employee VALUES(1,"nihal","1997-06-08","Blossom (H) calicut",'2018-06-02','9874521222',100,2500,'typist');
INSERT INTO employee VALUES(2,"nithin","1996-04-05","tvm house",'2018-06-02','9876541232',102,2000,'manager');
INSERT INTO employee VALUES(3,"abhilash","1993-01-22","raani house",'2018-06-02','9523210123',100,3000,'clerk');
INSERT INTO employee VALUES(4,"amjiyad","1996-03-15"," ekm house",'2018-06-02','9412023210',104,1500,'executive');
INSERT INTO employee VALUES(5,"arjun","1999-05-23","wayanad house",'2018-06-02','9632101202',103,7000,'chief');

-- (ii)	Display all the records from the above tables

select * from department;
select * from employee;

-- (iii)	Display the empno and name of all the employees from department no2
select emp_no , emp_name
from employee
where dept_no = 102;

-- (iv)	Display empno,name,designation,dept no and salary in the descending order of salary


select emp_no,emp_name,designation,salary
from employee
order by salary desc;

-- (v)	Display the empno and name of all employees whose salary is between 2000 and 5000


select emp_no,emp_name
from employee
where salary BETWEEN 2000 AND 5000;

-- (vi)	Display all designations without duplicate values.


select distinct designation
from employee;

-- (vii)	Display the dept name and total salary of employees of each department.


select dept_no,SUM(salary)
from employee
group by dept_no;


-- (viii)	Change the salary of employees to 25000 whose designation is ‘Typist’


update employee 
set salary = 25000
where designation = "typist";

-- (ix)	Change the mobile no of employee named ‘john’


update employee
set mobile_no = "9761232345"
where emp_name = "john";

-- (x)	Delete all employees whose salaries are equal to Rs.7000

delete from employee
where salary = 7000;

-- (xi)	Select the department that has total salary paid for its employees more than 25000


select dept_no
from employee
group by dept_no
having SUM(salary) > 25000;
