-- create a user
connect system;
create user username identified by password;
grant all privileges to username;

-- change the password of an account
connect / as sysdba;
select username,password from dba_users;
alter user username identified by password;