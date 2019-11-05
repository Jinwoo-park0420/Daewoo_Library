create table Library_member(
name nvarchar2(20) not null,
userid nvarchar2(20) constraint pk_member not null primary key,
password nvarchar2(20) not null,
email nvarchar2(40) not null,
address nvarchar2(100) not null,
phone_number nvarchar2(20) not null,
grade number(5) default 0 not null, 
joindate date default sysdate,    
lease_status number(8) default 0  not null,
jumin number(20) not null
);
