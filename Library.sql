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


insert into LIBRARY_MEMBER(name,userid,password,email,address,phone_number,grade,joindate,lease_status,birthYear)
values('1','1','1','1','1','1',1,sysdate,1,'1');



drop table Library_member;
select * from library_member;

