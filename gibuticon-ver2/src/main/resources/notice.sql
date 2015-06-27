drop table notice;
create table notice(
	notice_no number primary key,
	title varchar2(50) not null,
	write_date date not null,
	content clob not null,
	hits number not null
)
drop sequence notice_seq;
create sequence notice_seq;

insert into notice 
(notice_no,title,write_date,content,hits) values (notice_seq.nextval,'조원준',sysdate,'메롱','0')

update notice set title='조원준메롱',content='설레임맛잇다' where notice_no='1'

select notice_no,title,write_date,content,hits from notice where notice_no='1'

select * from NOTICE;

update notice set hits=hits+1 where notice_no='1'

select count(*) from notice

SELECT notice_no,title,write_date,content,hits
	FROM(SELECT notice_no,title,write_date,content,hits,CEIL(rownum/5) AS page
	FROM(SELECT notice_no,title,to_char(write_date,'YYYY.MM.DD') as write_date,content,hits FROM notice  
	where title like '%#{word}%' 
	order by notice_no desc)) WHERE page=#{1}