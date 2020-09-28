create table A_dogs(
	num number,
	member_id varchar2(35),--주인 아이디
	dname varchar2(40),
	dage number,
	breed varchar2(50),
	weight varchar2(10),
	neutral varchar2(5),
	gender varchar2(7),
	etc CLOB,
	constraint A_dogs_num_pk primary key(num),
	constraint A_dogs_member_id_fk foreign key(member_id) references A_member(id) on delete cascade
);

create sequence A_dogs_seq;