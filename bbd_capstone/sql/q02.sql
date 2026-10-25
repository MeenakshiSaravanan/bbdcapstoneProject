

select order_id,customer_id,item,status,amount from orders where amount is NULL order by order_id;