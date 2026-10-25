
select c.region, o.order_month,
count(distinct o.order_id) as no_of_orders,
count(distinct c.customer_id)as no_of_customers, 
sum(o.amount)as total_revenue, 
avg(o.amount)as avg_revenue,
status from customers c INNER JOIN orders o on c.customer_id=o.customer_id 
where status='completed' 
group by c.region,o.order_month 
order by c.region,o.order_month;

--To display the matching values from two tables that is we have to display existing orders and customers with no order not having amount so i m using inner join here.
--distict: while using distinct it lists out unique items (e.g., Airfryer, Smart Watch,Table Lamp) appear anywhere in the orders table without repeating a name for every time it was ordered. 