# Write your MySQL query statement below

with prod_unit_price as (
    select p.product_id,
    u.purchase_date,
    u.units,
    p.price,
    u.units * p.price as total
    from Prices p
    left join UnitsSold u
    on p.product_id = u.product_id
    and u.purchase_date >= p.start_date and u.purchase_date <= p.end_date
)
select product_id,
case
when sum(units) > 0 then round(sum(total) / sum(units), 2)
else 0
end as average_price
from prod_unit_price
group by product_id;