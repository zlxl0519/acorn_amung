create table A_reserve (
	num number,--예약번호
	member_id varchar2(35),--예약자 아이디
	dog_num number,--강아지 정보 pk
	room_num number,-- 방 pk
	checkin_date date,--체크인 날짜
	checkout_date date,--체크아웃 날짜
	start_time varchar2(50),--체크인 시간
	end_time varchar2(50),--체크아웃 시간
	name varchar2(35),--예약자명
	phone varchar2(15),--예약자 핸드폰 번호
	room_price number, --결제금액 저장
	regdate date, --예약 날짜
	state varchar2(50), --예약대기중, 예약완료, 예약취소
	constraint A_reserve_num_pk primary key(num),
	constraint A_reserve_member_id_fk foreign key(member_id) references A_member(id) on delete cascade,
	constraint A_reserve_dog_num_fk foreign key(dog_num) references A_dogs(num) on delete cascade,
	constraint A_reserve_room_num_fk foreign key(room_num) references A_room(num) on delete cascade
);

create sequence A_reserve_seq;