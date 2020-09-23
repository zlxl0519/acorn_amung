create table A_room (
num number, 
room_name varchar2(30), --객실 이름(프리미엄, 디럭스, 스탠다드)
weight varchar2(30),--강아지 몸무게에 맞는 객실들 존재 
room_reserve_state char(3) default 'no', -- 예약 되면 yes 로 바뀐다.
constraint A_rooms_num_pk primary key(num)
);

create sequence A_room_seq;

insert into A_room(num,room_name,weight, room_reserve_state) values(1, 'standade','3', 'no');
insert into A_room(num,room_name,weight, room_reserve_state) values(2, 'standade','6', 'no');
insert into A_room(num,room_name,weight, room_reserve_state) values(3, 'standade','9', 'no');
insert into A_room(num,room_name,weight, room_reserve_state) values(4, 'standade','10','no');

insert into A_room(num,room_name,weight, room_reserve_state) values(5, 'deluxe','3','no');
insert into A_room(num,room_name,weight, room_reserve_state) values(6, 'deluxe','6', 'no');
insert into A_room(num,room_name,weight, room_reserve_state) values(7, 'deluxe','9', 'no');
insert into A_room(num,room_name,weight, room_reserve_state) values(8, 'deluxe','10', 'no');

insert into A_room(num,room_name,weight, room_reserve_state) values(9, 'premium','3', 'no');
insert into A_room(num,room_name,weight, room_reserve_state) values(10, 'premium','6', 'no');
insert into A_room(num,room_name,weight, room_reserve_state) values(11, 'premium','9', 'no');
insert into A_room(num,room_name,weight, room_reserve_state) values(12, 'premium','10', 'no');