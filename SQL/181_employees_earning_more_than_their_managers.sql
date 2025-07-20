# Write your MySQL query statement below

select e.name as Employee
from Employee e
where e.managerId is not null
and e.salary > (select m.salary from Employee m where e.managerId = m.id);