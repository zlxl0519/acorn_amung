create table A_member(
id varchar2(35) not null, 
pwd varchar2(80) not null, 
email varchar2(60), 
profile varchar2(100), 
name varchar2(40) not null, 
phone varchar2(15) not null, 
regdate date,
constraint A_member_id_pk primary key(id)
);

create sequence A_member_seq;