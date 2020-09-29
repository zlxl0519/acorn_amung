create table A_room_price(
num number, 
weight varchar2(30), 
room_name varchar2(30),  -- (프리미엄, 디럭스, 스탠다드)
price number,
constraint A_room_price_num_pk primary key(num)
);

create sequence A_room_price_seq;

--샘플데이터 (하나의 방의 몸무게에 따라 가격이 다르다)
insert into A_room_price(num,weight, room_name, price) values(1, '3', 'standard', 30000);--3키로 이하일때 
insert into A_room_price(num,weight, room_name, price) values(2, '6', 'standard', 35000);--4~6키로 이하일때
insert into A_room_price(num,weight, room_name, price) values(3, '9', 'standard', 40000);--7~9키로 이하일때
insert into A_room_price(num,weight, room_name, price) values(4, '10', 'standard', 45000);--10키로 이상일때

insert into A_room_price(num,weight, room_name, price) values(5, '3', 'deluxe', 40000);--3키로 이하일때 
insert into A_room_price(num,weight, room_name, price) values(6, '6', 'deluxe', 45000);--4~6키로 이하일때
insert into A_room_price(num,weight, room_name, price) values(7, '9', 'deluxe', 50000);--7~9키로 이하일때
insert into A_room_price(num,weight, room_name, price) values(8, '10', 'deluxe', 55000);--10키로 이상일때

insert into A_room_price(num,weight, room_name, price) values(9, '3', 'premium', 60000);--3키로 이하일때 
insert into A_room_price(num,weight, room_name, price) values(10, '6', 'premium', 65000);--4~6키로 이하일때
insert into A_room_price(num,weight, room_name, price) values(11, '9', 'premium', 70000);--7~9키로 이하일때
insert into A_room_price(num,weight, room_name, price) values(12, '10', 'premium', 75000);--10키로 이상일때