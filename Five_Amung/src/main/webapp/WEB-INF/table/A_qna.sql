-- qna 테이블
CREATE TABLE A_qna (
num NUMBER,
writer VARCHAR2(100),
title VARCHAR2(300),
content CLOB,
regdate DATE,
hit NUMBER, --조회수
comm NUMBER, -- 댓글 수 
done NUMBER, -- 답변 완료 여부
CONSTRAINT A_qna_num_pk PRIMARY KEY(num)
);

CREATE SEQUENCE A_qna_seq;

-- qna 댓글 테이블 
CREATE A_qna_comment(
   num NUMBER PRIMARY KEY, --댓글의 글번호
   writer VARCHAR2(100), --댓글 작성자의 아이디
   content VARCHAR2(500), --댓글 내용
   target_id VARCHAR2(100), --댓글의 대상자 아이디
   ref_group NUMBER,
   comment_group NUMBER,
   deleted CHAR(3) DEFAULT 'no',
   regdate DATE
);

CREATE SEQUENCE A_qna_comment_seq;
