create table A_gallery_comment(
	num number primary key, -- 댓글의 글번호 (댓글이던 대댓글이던 다 자신만의 댓글 글번호를 가지고있음-pk)
	writer  varchar2(100), -- 댓글 작성자의 아이디
	content varchar2(500), -- 댓글 내용
	target_id varchar2(100), --댓글의 대상자
	ref_group number, -- 원글 글번호 (원글 글 밑에 달려있는 댓글들 한꺼번에 묶어서 가져오게)
	comment_group number, -- 댓글 글번호 (댓글 밑에 달려있는 대댓글들 한꺼번에 묶어서 가져오게/만약  자기 pk 글번호랑 comment_group 번호가 다르면 대댓글임)
	deleted char(3) default 'no', --삭제된건지 아닌지 알려주는거 
	regdate date
);


create sequence A_gallery_comment_seq;