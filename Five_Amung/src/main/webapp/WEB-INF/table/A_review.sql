CREATE TABLE A_review (
num NUMBER,
writer VARCHAR2(35),
profile VARCHAR2(200),
title VARCHAR2(100),
content CLOB,
regdate DATE,
rating NUMBER,
CONSTRAINT A_review_num_pk PRIMARY KEY(num)
);

CREATE SEQUENCE A_review_seq;

CREATE TABLE A_review_comment(
   num NUMBER PRIMARY KEY, --댓글의 글번호
   writer VARCHAR2(100), --댓글 작성자의 아이디 
   profile VARCHAR2(100), --프로필 이미지 경로
   content VARCHAR2(500), --댓글 내용
   target_id VARCHAR2(100), --댓글의 대상자 아이디
   ref_group NUMBER,
   comment_group NUMBER,
   deleted CHAR(3) DEFAULT 'no',
   regdate DATE
);

CREATE SEQUENCE A_review_comment_seq;
