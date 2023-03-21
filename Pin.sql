CREATE DATABASE IF NOT EXISTS pin;

USE pin;

CREATE TABLE IF NOT EXISTS userdata(
userid VARCHAR(20) PRIMARY KEY,
user_name VARCHAR(50),
user_mail VARCHAR(60),
user_phno VARCHAR(10),
user_pwd VARCHAR(20),
useraddress varchar(150),
userbankname VARCHAR(100),
useracco VARCHAR(100),
userifsc VARCHAR(100)

);

SELECT *
from userdata;

DESCRIBE userdata;

INSERT INTO userdata(userid,user_name,user_mail,user_phno)
VALUES("12432535","arun","arun123234@gmail.com","93818122");

SELECT *
from userdata;

CREATE TABLE IF NOT EXISTS fundraise(
fundraiseid VARCHAR (20) PRIMARY KEY,
title VARCHAR(200),
location VARCHAR(100),
cause VARCHAR(100),
cause_name VARCHAR(100),
story_summary VARCHAR(500),
story VARCHAR(500),
amount INT

);

select*
FROM fundraise;

describe fundraise;

ALTER TABLE fundraise
add FOREIGN KEY (fundraiseid) REFERENCES userdata(userid);

select*
FROM fundraise;
describe fundraise;

CREATE TABLE IF NOT EXISTS donater(
comment_id VARCHAR(20) PRIMARY KEY,
user_comment VARCHAR(500),
time_comment VARCHAR(100)
);

ALTER TABLE donater
add constraint donaterid
FOREIGN KEY (comment_id) REFERENCES userdata(userid);

ALTER TABLE donater
ADD comments VARCHAR(1000) NOT NULL;

UPDATE donater
SET comments = CONCAT(comment_id,'',user_comment,'',time_comment);

SELECT *
FROM donater;

DEScribe donater;

CREATE TABLE IF NOT EXISTS donate_details(
donate_id VARCHAR(20) PRIMARY KEY,
contribution INT
);

ALTER TABLE donate_details
add constraint donaterdetailsid
FOREIGN KEY (donate_id) REFERENCES userdata(userid);


SELECT *
FROM donate_details;

CREATE TABLE IF NOT EXISTS cover_pic (
pic VARCHAR(500)

);

ALTER TABLE cover_pic 
ADD coverpicid Varchar(20) PRIMARY KEY;

DESCRIBE cover_pic;
ALTER TABLE cover_pic
add constraint co
FOREIGN KEY (coverpicid) REFERENCES fundraise(fundraiseid);



CREATE TABLE IF NOT EXISTS req_doc (
doc_id Varchar(20) PRIMARY KEY,
doc VARCHAR(500)
);

ALTER TABLE req_doc
add constraint reqdocid
FOREIGN KEY (doc_id) REFERENCES fundraise(fundraiseid);


