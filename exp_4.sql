	-- Create a view for Department Managers:
create view manager as
select employee.emp_name,employee.dept_no,employee.salary,department.dept_name
from employee,department
where employee.designation = "manager" and employee.dept_no = department.dept_no;

	-- Find employees who earn more than their managers

select *
from employee
where  employee.salary > (select employee.salary from employee where designation = "manager");

-- Delete view
drop view manager;

-- Updating View

update manager
set salary = 2*salary
where dept_name = "finance";

-- Stored Procedure

create table deptsal as
select dept_no,0 as totalsalary from department;

drop table deptsal;



delimiter //
create procedure updatesalary(in param int)
begin
update deptsal
set totalsalary = (select sum(salary) from employee where dept_no = param)
where dept_no = param;
end //
delimiter ;

drop procedure updatesalary;

call updatesalary(101);
call updatesalary(102);
call updatesalary(103);
call updatesalary(104);

select * 
from deptsal;


-- Cursor

delimiter //

create procedure updatesalaryc() 
begin
declare done int default 0;
declare current_dnum  int;
declare dnumcur cursor for select dept_no from deptsal;
declare continue handler for not found set done  = 1;

open dnumcur;
repeat
		fetch dnumcur into current_dnum;
        update deptsal
        set totalsalary = (select sum(salary) from employee where dept_no = current_dnum)
        where dept_no = current_dnum;
until done 
end repeat;

close dnumcur;
end // 
delimiter ;

call updatesalaryc();

drop procedure updatesalary;
