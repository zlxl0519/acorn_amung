CREATE TABLE A_faq (
num NUMBER, 
qst CLOB, 
ans CLOB,
category VARCHAR2(100),
CONSTRAINT faq_num_pk PRIMARY KEY(num)
);

CREATE SEQUENCE faq_seq;