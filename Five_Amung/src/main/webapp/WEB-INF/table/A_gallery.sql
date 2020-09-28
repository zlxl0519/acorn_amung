create table A_gallery(
num number ,
id varchar2(35) ,
caption varchar2(100) not null,
subCaption varchar2(300),
content clob,
imagePath varchar2(100) not null,
hit number,
regdate date,
constraint A_gallery_num_pk primary key(num),
constraint A_gallery_id_fk foreign key(id) references A_member(id)
);

create table A_gallery(
num number ,
id varchar2(35) ,
caption varchar2(100),
subCaption varchar2(300),
content clob,
imagePath varchar2(100),
hit number,
regdate date
);

create sequence A_gallery_seq;