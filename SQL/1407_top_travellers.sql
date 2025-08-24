# Write your MySQL query statement below

with total_dist as (
    select
    user_id,
    sum(distance) as distance
    from Rides
    group by 1
)
select
u.name as name,
case
when td.distance is null then 0
else td.distance
end as travelled_distance
from Users u
left join total_dist td
on td.user_id = u.id
order by td.distance desc, u.name asc;