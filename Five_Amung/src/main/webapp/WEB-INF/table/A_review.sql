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

