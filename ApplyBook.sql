create table Applybook(
bookname nvarchar2(100) not null,
writer nvarchar2(100) not null,
publisher nvarchar2(100) not null,
publish_year nvarchar2(100) not null,
price number(30) not null,
genre nvarchar2(20) not null,
ISBN number(30) primary key not null,
userid nvarchar2(20) not null,
status number(5) not null
);

select * from applybook;

