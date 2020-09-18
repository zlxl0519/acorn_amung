create table A_dogs(
	num number primary key,
	member_id varchar2(35),--주인 아이디
	dname varchar2(40),
	dage number,
	breed vachar2(50),
	weight varchar2(10),
	neutral varchar2(5),
	gender varchar2(7),
	memo CLOB
);

create sequence A_dogs_seq;