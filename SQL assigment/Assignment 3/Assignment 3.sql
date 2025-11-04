-- create a dataset with columns category, subcategory, city, region,
create table orders(
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
		payment_method varchar(30),
		category varchar(30),
		subcategory varchar(30),
		city varchar(30),
		region varchar(30)		
)

select * from orders

--Set city as null for 3 order_ids--
update orders
set city = NULL
where order_id in ('ORD1001','ORD1005','ORD1020')

select * from orders
order by order_id

--Find the order_id , product_id , category ,sub_category where the city is null.
select order_id, product_id, category, subcategory
from orders
where city is null

--Find out the latest order_date and first order_date in every payment method.
select payment_method,
max(order_date) as latest_order_date,
min(order_date) as first_order_date
from orders
group by payment_method

--Find out the latest ship_date for every category and also total profit for every category
select category,
max(ship_date) as latest_ship_date,
sum(profit)
from orders
group by category

--Find the total quantity sold for each sub_category.
select subcategory,
sum(quantity) as total_quatity
from orders
group by subcategory

--Find the emp_id where products like Biscuit and Chips having same number of quantity sold from table named sales_data
select * from orders
select o1.order_id, o1.quantity 
from orders o1
join orders o2
on o1.order_id = o2.order_id
where o1.quantity = o2.quantity

--Find the bottom 5 sub_category in West region by total quantity sold
select subcategory,
sum(quantity) as total_quantity
from orders
where region = 'West'
group by subcategory
order by total_quantity asc
limit 5

--Find the total sales for each region and payment_method combination for product ordered in year 2023.
select region,
payment_method,
sum(price*quantity) as total_sales
from orders
group by region,payment_method
order by region,payment_method

--Find the order_ids where average of profit is greater then maximum profit.
select order_id
from orders
group by order_id
having avg(profit) > max(profit)

--Find the customer name where total quantity purchased by customer equals to the average quantity bought by all the customer
with reference as (
	select customer_name,
	sum(quantity) as total_quantity
	from orders
	group by customer_name
)
select customer_name
from reference
group by customer_name,total_quantity
having total_quantity = avg(total_quantity)

select * from orders