CREATE TABLE A_faq (
num NUMBER, 
qst CLOB, 
ans CLOB,
category VARCHAR2(100),
CONSTRAINT A_faq_num_pk PRIMARY KEY(num)
);

CREATE SEQUENCE A_faq_seq;