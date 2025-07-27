# Write your MySQL query statement below

with single_num as (
    select num
    from MyNumbers
    group by num
    having count(num) = 1
    order by num desc
    limit 1
)
select num from single_num
union all
select null as num
limit 1;