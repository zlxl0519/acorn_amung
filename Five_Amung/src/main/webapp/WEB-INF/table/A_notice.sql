CREATE TABLE A_notice(
	num NUMBER,
	title VARCHAR2(200) NOT NULL,
	category VARCHAR2(100),
	content CLOB,
	viewCount NUMBER, --조회수
	regdate DATE
);


CREATE SEQUENCE A_notice_seq;


SELECT NUM, WRITER, TITLE,
	LEAD(num, 1, 0) OVER (ORDER BY num DESC) AS nextNum,--번호에 대해서 내림차순 정렬 했을 때 하나 앞선다. 다음글
	Lag(num, 1, 0) OVER (ORDER BY num DESC) AS prevNum,--번호에 대해서 내림차순 정렬 했을 때 하나 뒤에꺼. 이전글
	FROM BOARD_CAFE 
	ORDER BY NUM DESC;