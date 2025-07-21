# Write your MySQL query statement below

select ow.id from Weather ow
where ow.temperature > (
    select iw.temperature from Weather iw
    where datediff(ow.recordDate, iw.recordDate) = 1
);