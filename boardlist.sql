create table library_board(
bno number(10) not null primary key,
title nvarchar2(200) not null,
content nvarchar2(2000) not null,
password nvarchar2(20) not null,
--current_password nvarchar2(20) not null,
writer nvarchar2(50) not null,
regdate date default sysdate,
updatedate date default sysdate,
readcnt number(10)--조회수
);

create sequence seq_libbno; --bno 시퀀스

drop table library_board;
drop sequence seq_libbno;

insert into library_board(bno,title,content,password,writer,regdate,readcnt) values(seq_libbno.nextVal,'1등','처음글','123','김사장',sysdate,0);

select * from library_board;

create table board_reply(
bno number(10) not null,
cno number(10) not null,
writer nvarchar2(50) not null,
regdate date default sysdate,
updatedate date default sysdate,
reply nvarchar2(2000),
primary key(bno,cno)
);

alter table board_reply
add constraint board_reply_bno foreign key(bno)
references library_board(bno);

insert into BOARD_REPLY(bno,cno,reply,writer,regdate)
values(21,seq_libcno.nextval,'댓글','이찬해',sysdate);

insert into BOARD_REPLY(bno,cno,reply,writer,regdate)
values(21,seq_libcno.nextval,'제발 달려라 진짜','이찬해',sysdate);

drop table board_reply;

create sequence seq_libcno;

select * from board_reply;




