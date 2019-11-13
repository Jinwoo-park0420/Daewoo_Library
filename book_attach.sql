create table book_attach(
	uuid varchar2(100) not null,
	uploadPath varchar2(100) not null,
	fileName varchar2(100) not null,
	fileType char(1) default 'I',
	bno number(10,0));
	
alter table book_attach
add constraint pk_attach primary key(uuid);

alter table book_attach
add constraint fk_book_attach
foreign key(bno) references book_report(bno);
