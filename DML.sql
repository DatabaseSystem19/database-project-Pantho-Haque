-- insert a table row
insert into accounts (user_id, name, address, blood_group, last_donation_date, date_of_birth, gender, mobile, email, whatsapp)
values (11, 'Pantho Haque', '123 Main St', 'O+', TO_DATE('2022-01-15', 'YYYY-MM-DD'), TO_DATE('2001-09-15', 'YYYY-MM-DD'), 'Male', '1234567890', 'pantho.haque@example.com', '1255567890');

-- view the table
select * 
from accounts 
where whatsapp='1255567890';

-- update a table row
update accounts 
set blood_group='O-' 
where whatsapp='1255567890';

-- delete a table row
delete from accounts 
where user_id=11;


--- union intersect except

-- aggregation 
prompt
prompt /*count*/
select count(blood_group) 
from posts 
where problem='Blood Donation';

prompt
prompt /*avg*/
select avg(number_of_bags) 
from posts;

prompt
prompt /*sum*/
select sum(number_of_bags) 
from posts ;

prompt
prompt /*max*/
select max(wbc_count) 
from posts ;

prompt
prompt /*min*/
select min(wbc_count) 
from posts ;


-- Grouping 
select blood_group,avg(wbc_count) from posts
group by blood_group;

-- having
select blood_group,avg(wbc_count) from posts
group by blood_group
having avg(wbc_count)>4800;

-- and or not

-- some all exists unique

-- strings

prompt 
prompt positive blood group
select * from accounts where blood_group like '%+';

prompt 
prompt Group of O
select * from accounts where blood_group like 'O_';


-- view and join

drop view PostComment;
CREATE VIEW PostComment AS
SELECT
  post_id,
  p.author_id AS post_author_id,
  p.blood_group AS post_blood_group,
  p.problem AS post_problem,
  p.post_text AS post_text,
  p.hospital_details AS post_hospital_details,
  p.post_date AS post_date,
  p.number_of_bags AS post_number_of_bags,
  p.wbc_count AS post_wbc_count,
  c.comment_id AS comment_id,
  c.text AS comment_text,
  c.author_id AS comment_author_id,
  c.timestamp AS comment_timestamp
FROM
  Posts p
JOIN
  Comments c USING (post_id);
  
select * from PostComment;



drop view AccPostComment;
CREATE VIEW AccPostComment AS
SELECT
  user_id,
  name,
  address,
  a.blood_group as user_blood_group,
  last_donation_date,
  date_of_birth,
  gender,
  mobile,
  email,
  whatsapp,
  post_id,
  p.author_id AS post_author_id,
  p.blood_group AS post_blood_group,
  p.problem AS post_problem,
  post_text,
  p.hospital_details AS post_hospital_details,
  post_date,
  p.number_of_bags AS post_number_of_bags,
  p.wbc_count AS post_wbc_count,
  c.comment_id AS comment_id,
  c.text AS comment_text,
  c.author_id AS comment_author_id,
  c.timestamp AS comment_timestamp
FROM
  accounts a join posts p on a.user_id=p.author_id
JOIN
  Comments c USING (post_id);
  
select * from AccPostComment;


-- time related 
 
prompt
prompt posts between 18-23 apr
select * from posts where extract(day from post_date) between 18 and 23;

prompt
prompt comments between 18-23 apr
SELECT *
FROM comments
WHERE extract(hour from timestamp) BETWEEN 10 and 14;


-- 2nd max element 
select * from posts order by wbc_count asc;

drop view postView;
create view postView as
select * from posts;

delete from postView where wbc_count=(
    select max(wbc_count) from postView
);

select * from postView where wbc_count=(
    select max(wbc_count) from postView
);
