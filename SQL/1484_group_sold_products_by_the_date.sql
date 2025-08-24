# Write your MySQL query statement below

with dist_sell as (
    select distinct * from Activities
)
select 
sell_date,
count(sell_date) as num_sold,
group_concat(product order by product separator ',') as products
from dist_sell
group by sell_date;