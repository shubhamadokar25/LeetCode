# Write your MySQL query statement below

select so.name from SalesPerson so
where so.name not in (
    select s.name from SalesPerson s
    left join Orders o
    on s.sales_id = o.sales_id
    left join Company c
    on o.com_id = c.com_id
    where c.name = 'RED'
);