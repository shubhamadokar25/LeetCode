# Write your MySQL query statement below

with student_subject as (
    select 
    s.student_id,
    s.student_name,
    su.subject_name
    from Students s
    cross join Subjects su
),
attempt_per_sub as (
    select student_id,
    subject_name,
    count(*) as total_attempt_per_sub
    from Examinations
    group by student_id, subject_name
)
select
ss.student_id,
ss.student_name,
ss.subject_name,
case
    when aps.total_attempt_per_sub is not null then aps.total_attempt_per_sub
    else 0
end as attended_exams
from student_subject ss
left join attempt_per_sub aps
on ss.student_id = aps.student_id
and ss.subject_name = aps.subject_name
order by ss.student_id, ss.subject_name;