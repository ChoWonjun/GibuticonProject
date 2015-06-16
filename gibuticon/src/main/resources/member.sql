drop table member;
create table member(
	id varchar2(50) primary key,
	password varchar2(50) not null,
	name varchar2(50) not null,
	address varchar2(50) not null,
	tel varchar2(50) not null,
	birth date not null,
	admin varchar2(50) not null,
	email varchar2(50) not null,
	point number not null
)

select * from member;

insert into member values ('java','1234','조원준','경기 성남시 분당구',
	'01090742928','1988-02-27','yes','amorce27@naver.com', 0);
insert into member values ('chocamp','cho057','조원준','경기 성남시 분당구','01090742928',to_date('1988/02/27','yyyy/mm/dd'),'yes','amorce27@naver.com',0);
   
	
select * from member where id='chocamp';

update member set password='cho05703',address='경기도 성남시 분당구',tel='010-9074-2928',
	email='chocamp@lycos.co.kr' where id='chocamp';
	
update member set point=100 where id='java';

delete from member where id='chocamp';