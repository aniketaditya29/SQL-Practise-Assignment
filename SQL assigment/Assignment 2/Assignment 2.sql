--Assignment 2--
create table sales(
		order_id varchar(50),
		order_date date,
		customer_name varchar(50),
		product_id varchar(50),
		product_name varchar(50),
		price numeric(10,2),
		quantity int,
		discount numeric(4,2),
		profit numeric(10,2),
		ship_date date,
		payment_method varchar(30)
)
--import the csv file --> 'order_data.csv'

select * from sales

--find out the customer whose name starts with 'A' and ends with 'n'--
select customer_name
from sales
where customer_name like 'A%' and customer_name like '%n'

--give the order details where order date is after 2023--
select * 
from sales
where date_part('year', order_date) != 2023

--find out the customer whose name is having 3rd letter as 'a' and 4th letter as 'd'
select customer_name
from sales
where customer_name like '__ad%'

--give orderid,productid,productname,orderdate and discount where order between june 2023 and november 2023--
select order_id,
product_id,
product_name,
order_date,
discount
from sales
where date_trunc('month', order_date) between '01-06-2023' and '01-11-2023'

--find out the customer whose name contains the word 'apple'--
select customer_name 
from sales
where customer_name like '%apple%'

--details for the orderid after june 2023 where payment_method is either cash or upi--
select order_id
from sales 
where order_date >= '01-06-2023' and payment_method = 'Cash' or payment_method = 'UPI' 

--find the customers whose name does not start with 'B' and end with 'ey'
select customer_name
from sales
where customer_name not like 'B%' and customer_name  not like '%ey'

--retrieve order details on 20th june 2023 and top 2 records based on highest profit if exists--
select * from sales
where order_date = '20-06-2023' 
order by profit desc
limit 2

--retrieve order details where payment method is cash and quantity is 3 or 7--
select * from sales
where payment_method = 'Cash' and (quantity = 3 or quantity = 7)

--retrieve details where profit > 100 and quantity between 2 and 5--
select * from sales 
where profit > 100 and (quantity between 2 and 5)

