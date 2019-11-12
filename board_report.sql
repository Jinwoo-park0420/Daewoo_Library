create table book_report(
bno number(10) not null primary key,
title nvarchar2(50) not null,
writer nvarchar2(50) not null,
content nvarchar2(1000) not null,
regdate date default sysdate,
password nvarchar2(100) not null,
apply number(2) default 0,
updatedate date default sysdate
);

create sequence seq_reportbno;//시퀀스생성 