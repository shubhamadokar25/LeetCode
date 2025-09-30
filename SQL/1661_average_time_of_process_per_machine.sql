# Write your MySQL query statement below

with each_run_time as (
    with start as (
        select machine_id, process_id, timestamp
        from activity
        where activity_type = 'start'
    ),
    end as (
        select machine_id, process_id, timestamp
        from activity
        where activity_type = 'end'
    )
    select s.machine_id, e.timestamp - s.timestamp as total_run_time
    from start s left join end e
    on s.machine_id = e.machine_id and s.process_id = e.process_id
)
select machine_id, round(avg(total_run_time), 3) as processing_time from each_run_time
group by machine_id;