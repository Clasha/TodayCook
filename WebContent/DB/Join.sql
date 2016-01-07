select * from join;

drop table join;

create table join(
	num number(4) primary key,
	email varchar2(50) not null,
	passwd varchar2(20) not null,
	nicname varchar2(30) not null
)segment creation immediate;

create sequence join_num;
drop sequence join_num;

insert into join values(join_num.nextval,?,?,?);
