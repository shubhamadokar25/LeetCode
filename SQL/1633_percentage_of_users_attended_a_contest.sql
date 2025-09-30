# Write your MySQL query statement below

with contest_user_count as (
    select distinct contest_id, count(*) as reg_user
    from register
    group by contest_id
)
select contest_id,
round((reg_user/(select count(distinct user_id) from users)) * 100, 2) as percentage from contest_user_count
order by percentage desc, contest_id asc;