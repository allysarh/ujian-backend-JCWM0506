use backend_2021;
select * from locations;
select * from movie_status;
select * from roles;
select * from schedules;
INSERT into schedules values (null, 1, 2, 3);
select * from show_times;
select * from status;
UPDATE users set idstatus = 1 where id = 1;
update movies set idmovie_status = 2 where idmovie = 1;

select * from users;
select * from users where username = 'allysarh' and password = 'abc123@';
select * from movies;
select * from movie_status;
select name, release_date, release_month, release_year, genre, description, location, time, movie_status from schedules s 
JOIN movies m 
JOIN locations l 
JOIN show_times t
JOIN status st
JOIN movie_status ms where 
m.idmovie = s.idmovie and 
l.idlocation = s.idlocation and
t.idtime = s.idtime and
m.idmovie_status = ms.idmovie_status and 
time = '1 PM' and location = 'Bandung';

select * from movies m JOIN movie_status ms where m.idmovie_status = ms.idmovie_status;
select * from locations;
insert into tb_products_stok values (null, 'blue', 1, 10, 1); 
insert into users values (null, uid, username, email, password, role, status);
select * from movies;
SELECT uid, u.status from users u JOIN status s where id = 1 and s.idstatus = u.idstatus;

 select name, release_date, release_month, release_year, genre, description, location, time, movie_status as status from schedules s
            JOIN movies m
            JOIN locations l
            JOIN show_times t
            JOIN status st
            JOIN movie_status ms where
            m.idmovie = s.idmovie and
            l.idlocation = s.idlocation and
            t.idtime = s.idtime and
            m.idmovie_status = ms.idmovie_status and name = 'Harry Potter';
            
select * from schedules s
JOIN movies m
JOIN locations l
where 
m.idmovie = s.idmovie and
s.idmovie = 11;
select * from schedules;
select * 
from schedules s
left join (
SELECT * 
from movies m
) as test ON m.idmovie = s.idmovie;

select * from movies;
select * from schedules;
select * from movie_status;

SELECT name, release_date, 
release_month, release_year, duration_min, genre, description, location, time, movie_status as status
from schedules as s
LEFT join movies as m
on m.idmovie = s.idmovie
left join locations as l
on s.idlocation = l.idlocation
left join show_times as t
on t.idtime = s.idtime
left join movie_status as ms
on ms.idmovie_status = m.idmovie_status
where name = 'Frozen 2';

SELECT name, release_date,
            release_month, release_year, duration_min, genre, description, location, time
            from schedules as s
            LEFT join movies as m
            on m.idmovie = s.idmovie
            left join locations as l
            on s.idlocation = l.idlocation
            left join show_times as t
            on t.idtime = s.idtime
            left join movie_status as ms
            on ms.idmovie_status = m.idmovie_status and name = 'Harry Potter';
            
            SELECT name, release_date,
            release_month, release_year, duration_min, genre, description, location, time
            from schedules as s
            LEFT join movies as m
            on m.idmovie = s.idmovie
            left join locations as l
            on s.idlocation = l.idlocation
            left join show_times as t
            on t.idtime = s.idtime
            left join movie_status as ms
            on ms.idmovie_status = m.idmovie_status where idmovie = 10;
            
select * from movies;
