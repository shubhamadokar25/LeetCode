# Write your MySQL query statement below

with order_group as (
    select o.customer_number,
    count(o.order_number) as total_orders
    from Orders o
    group by o.customer_number
)
select og.customer_number from order_group og
where og.total_orders = (select max(total_orders) from order_group);