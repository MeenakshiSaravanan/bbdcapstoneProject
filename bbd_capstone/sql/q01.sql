
select order_id,customer_id,item,amount,status from orders where status="pending" order by order_id asc;