create table A_popup(
num number primary key,
title varchar2(100),
window_width number,
window_height number,
location_top number,
location_left number,
imagePath varchar2(100)
);

create sequence A_popup_seq;