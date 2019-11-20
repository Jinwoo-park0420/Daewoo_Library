create table library_board(
bno number(10) not null primary key,
title nvarchar2(200) not null,
content nvarchar2(2000) not null,
password nvarchar2(20) not null,
--current_password nvarchar2(20) not null,
writer nvarchar2(50) not null,
regdate date default sysdate,
updatedate date default sysdate,
readcnt number(10),--조회수
replycnt number(10) default 0, --댓글수
constraint fk_library_user foreign key(writer)
references Library_member(userid)
on delete cascade
);

<!-- 트리거 만드는중 -->
create or replace trigger 



<!--spring_board 추가된 컬럼에 기존 값 업데이트하기  -->
update library_board set replycnt=(
	select count(cno) from board_reply where board_reply.bno=library_board.bno
);

create sequence seq_libbno; --bno 시퀀스

select * from library_board;

create table board_reply(
bno number(10) not null,
rno number(10) constraint pk_library primary key,
reply nvarchar2(2000) not null,
replyer varchar2(50) not null,
regdate date default sysdate,
updatedate date default sysdate,
constraint fk_reply_library foreign key(bno)
references library_board(bno)
on delete cascade
);

alter table board_reply
add constraint board_reply_bno foreign key(bno)
references library_board(bno)
on delete cascade;

create sequence seq_librno;

select * from board_reply;


drop table board_reply cascade constraints;
drop table library_board cascade constraints;
drop sequence seq_libbno;
drop sequence seq_librno;
alter table library_board drop constraint board_reply_bno;

drop constraint board_reply_bno