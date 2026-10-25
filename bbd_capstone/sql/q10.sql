

select c.customer_id,o.order_id, c.first_name, c.last_name, c.region 
from customers c LEFT JOIN orders o on c.customer_id = o.customer_id 
where o.order_id is NULL order by customer_id;