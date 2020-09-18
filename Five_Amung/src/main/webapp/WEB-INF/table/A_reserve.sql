create table A_reserve (
	num number primary key,--예약번호
	member_id varchar2(35),--예약자 아이디
	dog_num number,--강아지 정보 pk
	room_name varchar2(35),--방이름
	checkin_date date,--체크인 날짜
	checkout_date date,--체크아웃 날짜
	checkin_time varchar2(50),--체크인 시간
	checkout_time varchar2(50),--체크아웃 시간
	name varchar2(35),--예약자명
	phone varchar2(15),--예약자 핸드폰 번호
	regdate date, --예약 날짜
	cancel char(3) default 'no' --예약 취소 여부,디폴드 값으로 no 취소시 yes 
);

create sequence A_reserve_seq;