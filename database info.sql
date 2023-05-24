set linesize 9000;
set pagesize 9000;


-- get the name of user
show user;

-- get existing tables present in database
select table_name from user_tables;

select * from accounts;
select * from posts;
select * from mail;
select * from comments;
select * from reacts;