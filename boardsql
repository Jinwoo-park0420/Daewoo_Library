select * from LIBRARY_MEMBER;


create table library_board(
bno number(10) not null primary key,
title nvarchar2(200) not null,
content nvarchar2(2000) not null,
writer nvarchar2(50) not null,
regdate date default sysdate,
updatedate date default sysdate,
readcnt number(10)--조회수
);

create sequence seq_libbno; --bno 시퀀스

insert into library_board(bno,title,content,writer,regdate,readcnt) values(seq_libbno.nextVal,'1등','처음글','이찬해',sysdate,0);

select * from library_board;