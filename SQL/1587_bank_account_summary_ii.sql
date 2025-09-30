# Write your MySQL query statement below

with final_balance_greater_than_10k as (
    select account, sum(amount) as balance
    from transactions
    group by 1
    having sum(amount) > 10000
)
select u.name, fb.balance
from users u
inner join final_balance_greater_than_10k fb
on u.account = fb.account;