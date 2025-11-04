--Assignment 1--
drop table employees
create table employees(
	slNo serial primary key,
	emp_id varchar(50),
	emp_name varchar(50),
	designation varchar(50),
	salary numeric(10,2)
)

select * from employees

insert into employees(emp_id, emp_name, designation, salary)
values  ('E001','Anil', 'HR', 60000),
		('E002','Aman', 'CEO', 100000),
		('E003','Sahil', 'Manager', 80000),
		('E004','Sonu', 'GET', 40000),
		('E005','Rohan', 'Intern', 10000)

--update salary in the table--
update employees
set salary = 50000
where salary = 40000

select * from employees order by slno


--delete designation column from the table--
alter table employees
drop column designation
select * from employees order by slno

--delete row with the least salary--
delete from employees
where salary = (select min(salary) from employees)
select * from employees order by slno

--delete all data from the table
delete from employees
select * from employees order by slno

--drop the whole table--
drop table employees

