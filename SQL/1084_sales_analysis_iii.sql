# Write your MySQL query statement below

with q1_sales as (
    select product_id
    from Sales
    where sale_date between '2019-01-01' and '2019-03-31'
    and product_id not in (
        select product_id
        from Sales
        where sale_date not between '2019-01-01' and '2019-03-31'
    )
)
select distinct q1.product_id, p.product_name from q1_sales q1
left join Product p
on q1.product_id = p.product_id;