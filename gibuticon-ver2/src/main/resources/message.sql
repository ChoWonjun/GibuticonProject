drop table gibu_message;
create table gibu_message(
	no number primary key,
	sender_id varchar2(200) not null,
	receiver_id varchar2(200) not null,
	title varchar2(200)	 not null,
	content varchar2(200) not null,
	send_time date not null,
	read_time date
)

create sequence gibu_message_seq nocache;

-- 메시지 전송
insert into gibu_message(no, sender_id, receiver_id, title, content, send_time)
values(gibu_message_seq.nextval, 'java', 'java3', '야 확인해라','이건 내용이다',sysdate);

-- 메시지 읽음처리
update gibu_message set read_time=sysdate where no=1;

-- 메시지 삭제처리
delete from gibu_message where no=1;

select m.no, m.sender_id, m.receiver_id, mem.name, m.title, m.content, m.send_time, m.read_time 
from gibu_message m, member mem
where no=2 and m.sender_id=mem.id

select m.no, m.sender_id, m.receiver_id, mem.name, m.title, m.content, m.send_time, m.read_time 
from gibu_message m, member mem
where m.sender_id='java' and m.sender_id=mem.id


select * from (
select ceil(rownum/10) page, no, sender_id, name, title, send_time, read_time from(
select m.no, m.sender_id, mem.name, m.title, to_char(m.send_time,'YYYY/MM/DD') send_time, m.read_time 
from gibu_message m, member mem
where m.receiver_id='java' and m.sender_id=mem.id
order by m.send_time desc)) where page=1;

select count(no) from gibu_message where receiver_id='java';
