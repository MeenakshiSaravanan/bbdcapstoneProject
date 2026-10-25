
select o.order_id, o.order_month, c.first_name,c.last_name,c.region,r.rep_name, o.item,o.quantity,o.amount,o.status 
from orders o left join customers c on o.customer_id=c.customer_id 
left join reps r on c.rep_id=r.rep_id 
order by order_id;