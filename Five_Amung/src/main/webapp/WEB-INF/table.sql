create table A_member(
id varchar2(35) not null, 
pwd varchar2(80) not null, 
email varchar2(40), 
profile varchar2(100), 
name varchar2(15) not null, 
phone varchar2(15) not null, 
regdate date,
constraint am_member_id_pk primary key(id)
);

create sequence A_member_seq;