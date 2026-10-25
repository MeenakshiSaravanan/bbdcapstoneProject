
select r.rep_name,o.order_month, r.monthly_target, sum(o.amount)as revenue, 
  case
    when sum(o.amount) < r.monthly_target then 'Below Target'
    when sum(o.amount) < 1.1 * r.monthly_target then 'on Target'
  else 'Above Target'
  end as performance_tier 
  from reps r 
  Inner join customers c on r.rep_id=c.rep_id 
  Inner join orders o on c.customer_id= o.customer_id
  where o.status='completed'
  group by r.rep_name, o.order_month,r.monthly_target 
  order by r.rep_name,o.order_month;            

