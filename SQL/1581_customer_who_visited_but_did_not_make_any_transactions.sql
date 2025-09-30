# Write your MySQL query statement below

with trans_comp as (
    select v.visit_id, v.customer_id, t.transaction_id from visits v
    left join transactions t
    on v.visit_id = t.visit_id
)
select customer_id, count(customer_id) as count_no_trans from trans_comp
where transaction_id is null
group by 1;