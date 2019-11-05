create table Library_book(
	Library_bookcode nvarchar2(10) not null,
	Library_bookname nvarchar2(100) not null,
	Library_bookgenre nvarchar2(20) not null,
	Library_bookwriter nvarchar2(50) not null,
	Library_bookstatus nvarchar2(10) not null,
	Library_newbookdate date default sysdate,
	Library_lenbookdate date default sysdate
);
<<<<<<< HEAD

select * from Library_book;
=======
>>>>>>> refs/remotes/origin/master
