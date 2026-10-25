
select region, 
count(customer_id)as number_of_customers,
round(avg(age))as avg_age, 
min(age)as min_age, 
max(age)as max_age from customers 
group by region 
order by region;