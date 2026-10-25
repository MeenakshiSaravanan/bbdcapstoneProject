
select item, sum(amount)as total_revenue, 
  case 
    when sum(amount) >= 60000 then "High contributor"
    when sum(amount) >= 15000 then "Medium contributor"
  else "Low contributor"
  end as contributor_tier
  from orders 
  where status='completed' 
  group by item 
  order by total_revenue desc; 