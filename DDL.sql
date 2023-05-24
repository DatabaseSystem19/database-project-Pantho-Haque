-- droping tables

drop table reacts;
drop table mail;
drop table comments;
drop table posts;
drop table accounts;


-- Creating tables

CREATE TABLE Accounts (
  user_id NUMBER PRIMARY KEY,
  name VARCHAR2(50),
  address VARCHAR2(100),
  blood_group VARCHAR2(10),
  last_donation_date DATE,
  date_of_birth DATE,
  gender VARCHAR2(10),
  mobile VARCHAR2(20),
  email VARCHAR2(100),
  whatsapp VARCHAR2(20)
);

CREATE TABLE Posts (
  post_id NUMBER PRIMARY KEY,
  author_id NUMBER,
  blood_group VARCHAR2(10),
  problem VARCHAR2(100),
  post_text VARCHAR2(4000),
  hospital_details VARCHAR2(100),
  post_date DATE,
  number_of_bags NUMBER,
  wbc_count NUMBER,
  FOREIGN KEY (author_id) REFERENCES Accounts(user_id) on delete cascade
);

CREATE TABLE Comments (
  comment_id NUMBER PRIMARY KEY,
  text VARCHAR2(4000),
  author_id NUMBER,
  post_id NUMBER,
  timestamp TIMESTAMP,
  FOREIGN KEY (author_id) REFERENCES Accounts(user_id) on delete cascade,
  FOREIGN KEY (post_id) REFERENCES Posts(post_id) on delete cascade
);

CREATE TABLE Mail (
  mail_id NUMBER PRIMARY KEY,
  text VARCHAR2(4000),
  sender_id NUMBER,
  receiver_id NUMBER,
  ts TIMESTAMP,
  FOREIGN KEY (sender_id) REFERENCES Accounts(user_id) on delete cascade ,
  FOREIGN KEY (receiver_id) REFERENCES Accounts(user_id) on delete cascade
);

CREATE TABLE Reacts (
  react_id NUMBER PRIMARY KEY,
  interested NUMBER,
  giving NUMBER,
  author_id NUMBER,
  post_id NUMBER,
  timestamp TIMESTAMP,
  FOREIGN KEY (author_id) REFERENCES Accounts(user_id) on delete cascade,
  FOREIGN KEY (post_id) REFERENCES Posts(post_id) on delete cascade
);


-- ddl -> column add,modify,rename,drop

-- column add
alter table mail add cc varchar(20);

-- column modify
alter table mail modify cc varchar(10);

-- column rename
alter table mail rename column cc to cc_id;

-- column drop
alter table mail drop column cc_id;

prompt **************** data inserting ****************

-- data insertion 

-- for account table
prompt 
prompt 
prompt <accounts table>

insert into accounts (user_id, name, address, blood_group, last_donation_date, date_of_birth, gender, mobile, email, whatsapp)
values (1, 'John Doe', '123 Main St', 'A+', TO_DATE('2022-01-15', 'YYYY-MM-DD'), TO_DATE('1990-05-10', 'YYYY-MM-DD'), 'Male', '1234567890', 'john.doe@example.com', '1234567890');

insert into accounts (user_id, name, address, blood_group, last_donation_date, date_of_birth, gender, mobile, email, whatsapp)
values (2, 'Jane Smith', '456 Elm St', 'O-', TO_DATE('2021-12-20', 'YYYY-MM-DD'), TO_DATE('1985-09-22', 'YYYY-MM-DD'), 'Female', '9876543210', 'jane.smith@example.com', '9876543210');

insert into accounts (user_id, name, address, blood_group, last_donation_date, date_of_birth, gender, mobile, email, whatsapp)
values(3, 'David Johnson', '789 Oak St', 'B+', TO_DATE('2023-03-05', 'YYYY-MM-DD'), TO_DATE('1978-11-15', 'YYYY-MM-DD'), 'Male', '5555555555', 'david.johnson@example.com', '5555555555');

insert into accounts (user_id, name, address, blood_group, last_donation_date, date_of_birth, gender, mobile, email, whatsapp)
values(4, 'Emily Wilson', '321 Pine St', 'AB-', TO_DATE('2022-08-02', 'YYYY-MM-DD'), TO_DATE('1995-07-10', 'YYYY-MM-DD'), 'Female', '7777777777', 'emily.wilson@example.com', '7777777777');
  
insert into accounts (user_id, name, address, blood_group, last_donation_date, date_of_birth, gender, mobile, email, whatsapp)
values(5, 'Michael Lee', '654 Cedar St', 'O+', TO_DATE('2022-12-18', 'YYYY-MM-DD'), TO_DATE('1982-04-25', 'YYYY-MM-DD'), 'Male', '9999999999', 'michael.lee@example.com', '9999999999');
  
insert into accounts (user_id, name, address, blood_group, last_donation_date, date_of_birth, gender, mobile, email, whatsapp)
values(6, 'Olivia Brown', '987 Maple St', 'A-', TO_DATE('2023-01-30', 'YYYY-MM-DD'), TO_DATE('1998-09-05', 'YYYY-MM-DD'), 'Female', '2222222222', 'olivia.brown@example.com', '2222222222');

insert into accounts (user_id, name, address, blood_group, last_donation_date, date_of_birth, gender, mobile, email, whatsapp)
values(7, 'Daniel Taylor', '234 Walnut St', 'B-', TO_DATE('2023-02-12', 'YYYY-MM-DD'), TO_DATE('1987-02-18', 'YYYY-MM-DD'), 'Male', '4444444444', 'daniel.taylor@example.com', '4444444444');

insert into accounts (user_id, name, address, blood_group, last_donation_date, date_of_birth, gender, mobile, email, whatsapp)
values(8, 'Sophia Davis', '567 Spruce St', 'AB+', TO_DATE('2022-06-10', 'YYYY-MM-DD'), TO_DATE('1993-12-29', 'YYYY-MM-DD'), 'Female', '6666666666', 'sophia.davis@example.com', '6666666666');

insert into accounts (user_id, name, address, blood_group, last_donation_date, date_of_birth, gender, mobile, email, whatsapp)
values(9, 'William Martinez', '876 Birch St', 'A+', TO_DATE('2022-09-25', 'YYYY-MM-DD'), TO_DATE('1989-08-12', 'YYYY-MM-DD'), 'Male', '1111111111', 'william.martinez@example.com', '1111111111');

insert into accounts (user_id, name, address, blood_group, last_donation_date, date_of_birth, gender, mobile, email, whatsapp)
values(10, 'Ava Anderson', '432 Oak St', 'O-', TO_DATE('2023-03-20', 'YYYY-MM-DD'), TO_DATE('1996-01-03', 'YYYY-MM-DD'), 'Female', '3333333333', 'ava.anderson@example.com', '3333333333');


--for posts table 
prompt 
prompt
prompt <posts table>

insert into posts (post_id, author_id, blood_group, problem, post_text, hospital_details, post_date, number_of_bags, wbc_count)
values (1, 1, 'A+', 'Blood Donation', 'I am available to donate blood. Please let me know if anyone needs it.', 'City Hospital', TO_DATE('2023-04-15', 'YYYY-MM-DD'), 2, 5000);

insert into posts (post_id, author_id, blood_group, problem, post_text, hospital_details, post_date, number_of_bags, wbc_count)
values (2, 2, 'O-', 'Emergency Blood Request', 'Urgently need O- blood for a surgery. Please contact if you can help.', 'General Hospital', TO_DATE('2023-04-16', 'YYYY-MM-DD'), 3, 4500);

insert into posts (post_id, author_id, blood_group, problem, post_text, hospital_details, post_date, number_of_bags, wbc_count)
values (3, 3, 'B+', 'Plasma Donation', 'Looking to donate plasma for COVID-19 patients. Contact me if interested.', 'Red Cross Hospital', TO_DATE('2023-04-17', 'YYYY-MM-DD'), 1, 4000);

insert into posts (post_id, author_id, blood_group, problem, post_text, hospital_details, post_date, number_of_bags, wbc_count)
values (4, 4, 'AB-', 'Platelet Donation', 'I have a high platelet count and can donate platelets. Reach out if needed.', 'Community Hospital', TO_DATE('2023-04-18', 'YYYY-MM-DD'), 2, 5500);

insert into posts (post_id, author_id, blood_group, problem, post_text, hospital_details, post_date, number_of_bags, wbc_count)
values (5, 5, 'O+', 'Blood Donation', 'Donating blood today. If anyone needs O+ blood, please let me know.', 'City Hospital', TO_DATE('2023-04-19', 'YYYY-MM-DD'), 2, 4800);

insert into posts (post_id, author_id, blood_group, problem, post_text, hospital_details, post_date, number_of_bags, wbc_count)
values (6, 6, 'A-', 'Blood Donation', 'Ready to donate blood. Contact me for details.', 'General Hospital', TO_DATE('2023-04-20', 'YYYY-MM-DD'), 1, 5200);

insert into posts (post_id, author_id, blood_group, problem, post_text, hospital_details, post_date, number_of_bags, wbc_count)
values (7, 7, 'B-', 'Plasma Donation', 'Recovered from COVID-19 and willing to donate plasma. Let me know if you need it.', 'Red Cross Hospital', TO_DATE('2023-04-21', 'YYYY-MM-DD'), 1, 4100);

insert into posts (post_id, author_id, blood_group, problem, post_text, hospital_details, post_date, number_of_bags, wbc_count)
values (8, 8, 'AB+', 'Blood Donation', 'I am a regular blood donor. Reach out if you require AB+ blood.', 'Community Hospital', TO_DATE('2023-04-22', 'YYYY-MM-DD'), 3, 5900);

insert into posts (post_id, author_id, blood_group, problem, post_text, hospital_details, post_date, number_of_bags, wbc_count)
values (9, 9, 'A+', 'Platelet Donation', 'Available for platelet donation. Contact me if you need it.', 'City Hospital', TO_DATE('2023-04-23', 'YYYY-MM-DD'), 2, 4700);

insert into posts (post_id, author_id, blood_group, problem, post_text, hospital_details, post_date, number_of_bags, wbc_count)
values (10, 10, 'O-', 'Emergency Blood Request', 'Urgently need O- blood for a patient. Please help if you can.', 'General Hospital', TO_DATE('2023-04-24', 'YYYY-MM-DD'), 4, 5200);


--for mail table 
prompt 
prompt
prompt <mail table>

insert into Mail (mail_id, text, sender_id, receiver_id, ts)
values (1, 'Hello, I saw your blood donation post. I need A+ blood. Can you help me?', 2, 1, TIMESTAMP '2023-04-15 09:30:00');

insert into Mail (mail_id, text, sender_id, receiver_id, ts)
values (2, 'Thank you for offering to donate blood. I am in urgent need of O- blood. Can we arrange a time?', 1, 2, TIMESTAMP '2023-04-15 10:15:00');

insert into Mail (mail_id, text, sender_id, receiver_id, ts)
values (3, 'Hi, I heard you are donating plasma. I am interested. Can you provide me with more information?', 1, 3, TIMESTAMP '2023-04-16 14:45:00');

insert into Mail (mail_id, text, sender_id, receiver_id, ts)
values (4, 'Sure, I can donate platelets. Lets discuss the details.', 4, 6, TIMESTAMP '2023-04-17 16:20:00');

insert into Mail (mail_id, text, sender_id, receiver_id, ts)
values (5, 'I am in need of O+ blood. Can we arrange a meeting at the hospital?', 7, 5, TIMESTAMP '2023-04-18 11:50:00');

insert into Mail (mail_id, text, sender_id, receiver_id, ts)
values (6, 'Thank you for donating blood. It saved a life!', 5, 1, TIMESTAMP '2023-04-19 18:10:00');

insert into Mail (mail_id, text, sender_id, receiver_id, ts)
values (7, 'I received your plasma donation. It will greatly help the COVID-19 patients.', 3, 7, TIMESTAMP '2023-04-20 09:05:00');

insert into Mail (mail_id, text, sender_id, receiver_id, ts)
values (8, 'Hello, I am in need of AB+ blood. Can you donate?', 6, 8, TIMESTAMP '2023-04-21 13:30:00');

insert into Mail (mail_id, text, sender_id, receiver_id, ts)
values (9, 'Thank you for the platelet donation. Your contribution made a difference.', 9, 10, TIMESTAMP '2023-04-22 15:45:00');

insert into Mail (mail_id, text, sender_id, receiver_id, ts)
values (10, 'I am sorry, but I do not have O- blood. I hope you find a donor soon.', 10, 2, TIMESTAMP '2023-04-23 17:55:00');



--for comments table 
prompt 
prompt
prompt <comments table>

-- Inserting sample data into the Comments table
insert into Comments (comment_id, text, author_id, post_id, timestamp)
values (1, 'I can donate blood. Let me know if you need it.', 1, 1, TO_TIMESTAMP('2023-04-15 10:30:00', 'YYYY-MM-DD HH24:MI:SS'));

insert into Comments (comment_id, text, author_id, post_id, timestamp)
values (2, 'I hope the surgery goes well. Sending positive vibes.', 2, 2, TO_TIMESTAMP('2023-04-16 12:45:00', 'YYYY-MM-DD HH24:MI:SS'));

insert into Comments (comment_id, text, author_id, post_id, timestamp)
values (3, 'Thank you for offering to donate plasma. We really need it.', 3, 3, TO_TIMESTAMP('2023-04-17 15:20:00', 'YYYY-MM-DD HH24:MI:SS'));

insert into Comments (comment_id, text, author_id, post_id, timestamp)
values (4, 'Platelet donation can make a huge difference. Appreciate your willingness.', 4, 4, TO_TIMESTAMP('2023-04-18 09:10:00', 'YYYY-MM-DD HH24:MI:SS'));

insert into Comments (comment_id, text, author_id, post_id, timestamp)
values (5, 'I might need O+ blood. I will contact you soon.', 5, 5, TO_TIMESTAMP('2023-04-19 14:30:00', 'YYYY-MM-DD HH24:MI:SS'));

insert into Comments (comment_id, text, author_id, post_id, timestamp)
values (6, 'Thank you for being ready to donate blood.', 6, 6, TO_TIMESTAMP('2023-04-20 16:45:00', 'YYYY-MM-DD HH24:MI:SS'));

insert into Comments (comment_id, text, author_id, post_id, timestamp)
values (7, 'I am interested in the plasma donation. I will contact you for details.', 7, 7, TO_TIMESTAMP('2023-04-21 11:20:00', 'YYYY-MM-DD HH24:MI:SS'));

insert into Comments (comment_id, text, author_id, post_id, timestamp)
values (8, 'Thank you for being a regular blood donor. Your contribution is valuable.', 8, 8, TO_TIMESTAMP('2023-04-22 13:15:00', 'YYYY-MM-DD HH24:MI:SS'));

insert into Comments (comment_id, text, author_id, post_id, timestamp)
values (9, 'Platelet donation can be life-saving. I appreciate your availability.', 9, 9, TO_TIMESTAMP('2023-04-23 18:50:00', 'YYYY-MM-DD HH24:MI:SS'));

insert into Comments (comment_id, text, author_id, post_id, timestamp)
values (10, 'I will check if I can help with O- blood. Stay strong!', 10, 10, TO_TIMESTAMP('2023-04-24 09:40:00', 'YYYY-MM-DD HH24:MI:SS'));



--for reacts table 
prompt 
prompt
prompt <reacts table>

insert into reacts (react_id, interested, giving, author_id, post_id, timestamp)
values (1, 1, 0, 2, 3, TIMESTAMP '2023-04-23 09:15:00');

insert into reacts (react_id, interested, giving, author_id, post_id, timestamp)
values (2, 0, 1, 5, 1, TIMESTAMP '2023-04-23 10:30:00');

insert into reacts (react_id, interested, giving, author_id, post_id, timestamp)
values (3, 1, 1, 9, 7, TIMESTAMP '2023-04-23 12:45:00');

insert into reacts (react_id, interested, giving, author_id, post_id, timestamp)
values (4, 1, 0, 3, 4, TIMESTAMP '2023-04-23 14:20:00');

insert into reacts (react_id, interested, giving, author_id, post_id, timestamp)
values (5, 0, 1, 6, 2, TIMESTAMP '2023-04-23 16:10:00');

insert into reacts (react_id, interested, giving, author_id, post_id, timestamp)
values (6, 1, 1, 1, 9, TIMESTAMP '2023-04-23 17:55:00');

insert into reacts (react_id, interested, giving, author_id, post_id, timestamp)
values (7, 0, 1, 7, 8, TIMESTAMP '2023-04-23 19:30:00');

insert into reacts (react_id, interested, giving, author_id, post_id, timestamp)
values (8, 1, 0, 4, 5, TIMESTAMP '2023-04-23 21:05:00');

insert into reacts (react_id, interested, giving, author_id, post_id, timestamp)
values (9, 1, 0, 10, 10, TIMESTAMP '2023-04-23 22:40:00');

insert into reacts (react_id, interested, giving, author_id, post_id, timestamp)
values (10, 0, 1, 8, 6, TIMESTAMP '2023-04-23 23:55:00');
