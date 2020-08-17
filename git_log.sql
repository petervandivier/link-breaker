create table git_log (
    hash char(40) not null unique,
    i int not null primary key
);
copy git_log from '/Users/pvandivier/Desktop/collide/log' with delimiter ' ';
--
copy (
    select 
        *, 
        left(hash,7)
    from git_log
    where left(hash,7) in (
        select
            left(hash,7)
        from git_log
        group by left(hash,7)
        having count(*) > 1
    )
    order by 3, 2
) to stdout csv header;
