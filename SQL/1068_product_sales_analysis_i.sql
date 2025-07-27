# Write your MySQL query statement below

select p.product_name, s.year, s.price
from product p
left join Sales s
on p.product_id = s.product_id
where s.product_id is not null;