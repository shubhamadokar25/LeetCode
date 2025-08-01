# Write your MySQL query statement below

with filter_feb_min_100_products as (
    select product_id,
    sum(unit) as total_sold
    from Orders
    where month(order_date) = 2 and year(order_date) = 2020
    group by product_id
    having sum(unit) >= 100
)
select
p.product_name,
f.total_sold as unit
from filter_feb_min_100_products f
left join Products p
on f.product_id = p.product_id;