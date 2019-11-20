-- ===========================================회원 테이블
create table Library_member(
name nvarchar2(20) not null,
userid nvarchar2(20) constraint pk_Library_member not null primary key,
password nvarchar2(300) not null,
email nvarchar2(40) not null,
address nvarchar2(100) not null,
phone_number nvarchar2(20) not null,
grade number(5) default 0 not null, 
joindate date default sysdate,    
lease_status number(8) default 0  not null,
birthYear nvarchar2(50) not null
);


-- =============================================희망도서신청

create table Applybook(
bookname nvarchar2(100) not null,
writer nvarchar2(100) not null,
publisher nvarchar2(100) not null,
publish_year nvarchar2(100) not null,
price number(30) not null,
genre nvarchar2(20) not null,
ISBN number(30) primary key not null,
userid nvarchar2(20) not null,
applystatus number(5) default 0,
constraint fk_applybook foreign key(userid)
REFERENCES library_member(userid)
on delete cascade
);



-- =========================================독후감 
create table book_report(
bno number(10) CONSTRAINT pk_book_report primary key,
title nvarchar2(50) not null,
writer nvarchar2(50) not null,
content nvarchar2(1000) not null,
regdate date default sysdate,
password nvarchar2(100) not null,
apply number(2) default 0,
updatedate date default sysdate,
constraint fk_book_report foreign key(writer) REFERENCES  library_member(userid)
on delete cascade
);
create sequence seq_reportbno;


-- ========================================파일첨부
create table book_attach(
	uuid varchar2(100) constraint pk_attach primary key,
	uploadPath varchar2(100) not null,
	fileName varchar2(100) not null,
	fileType char(1) default 'I',
	bno number(10,0)),
	constraint fk_book_attach
	foreign key(bno) references book_report(bno)
on delete cascade
);


-- =====================================게시판
create table library_board(
bno number(10) constraint pk_library_board  primary key,
title nvarchar2(200) not null,
content nvarchar2(2000) not null,
password nvarchar2(20) not null,
--current_password nvarchar2(20) not null,
writer nvarchar2(50) not null,
regdate date default sysdate,
updatedate date default sysdate,
readcnt number(10),--조회수
replycnt number(10) default 0, --댓글수
constraint fk_LIBRARY_USER foreign key(writer) REFERENCES  library_member(userid)
on delete cascade
);
create sequence seq_libbno; --시퀀스 생성

-- ========================================댓글
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

create sequence seq_librno; --시퀀스생성
-- ==============================================도서

create table bookList(
	bookno number(10) constraint pk_booklist primary key,
	bookname nvarchar2(100) not null,
	genre nvarchar2(20) not null,
	writer nvarchar2(50) not null,
	publisher nvarchar2(20) not null,
	status nvarchar2(10) not null ,
	isbn number(20) not null
);

create sequence seq_bookno
start with 0
minvalue 0
maxvalue 100;


-- ================================================대여
create table lend(
	lendno number(10) constraint pk_lendno primary key,
	userid nvarchar2(20) not null,
	bookno number(10) not null,
	constraint fk_lend_userid foreign key(userid)
	references library_member(userid) on delete cascade ,
	constraint fk_lend_bookno foreign key(bookno)
	references booklist(bookno) on delete cascade 
);
 create sequence seq_lendno; 시퀀스 생성