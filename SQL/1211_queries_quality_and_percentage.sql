# Write your MySQL query statement below

select o.query_name,
round(avg(o.rating/o.position), 2) as quality,
round(((select count(1) from Queries i where i.query_name = o.query_name and i.rating < 3)/(select count(1) from Queries i where i.query_name = o.query_name)) * 100, 2) as poor_query_percentage
from Queries o
group by o.query_name;