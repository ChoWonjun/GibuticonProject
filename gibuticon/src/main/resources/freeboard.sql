자유게시판글번호(프라이머리키),제목, 작성일, 글내용, 조회수, 작성자id(fk)

drop table free_board;

alter table free_board add(ref number not null);
alter table free_board add(restep number not null);
alter table free_board add(relevel number not null);
alter table free_board modify(hits number default 0);
create table free_board(
	board_no number primary key,
	title varchar2(50) not null,
	write_date date not null,
	content varchar2(200) not null,
	hits number not null,
	id varchar2(50),
	constraint fk_id foreign key(id) references member
)

drop table freeBoard_comment;
alter table freeBoard_comment modify(hits number default 0);

create table freeBoard_comment(
	freeboard_comment_no number primary key,
	write_date date not null,
	freeboard_comment varchar2(100) not null,
	hits number not null,
	id varchar2(50),
	board_no number,
	constraint fk_freeBoard_id foreign key(id) references member,
	constraint fk_board_no foreign key(board_no) references free_board
)
select fc.freeboard_comment_no, fc.write_date, fc.freeboard_comment, fc.hits, fb.id, fb.board_no from freeBoard_comment fc, free_board fb where fb.id='chocamp' and fb.board_no=61;

insert into freeBoard_comment(freeboard_comment_no, write_date, freeboard_comment, hits, id, board_no) values(freeboard_comment_sequence.nextval,sysdate,'왕왕',0,'chocamp',61);

create sequence freeboard_comment_sequence;

create sequence free_board_sequence;

drop sequence free_board_sequence;

select * from free_board;

insert into free_board values (free_board_sequence.nextval,'whatamidoinghere',sysdate,'whoamiandwhereami',0,'chocamp');
	
select * from free_board where id='chocamp';

delete from free_board where id='chocamp';

delete from free_board where board_no='28';

 select fb.board_no, fb.title, fb.write_date, fb.content, fb.hits, fb.id from (
  			select fb.board_no, fb.title, fb.write_date, fb.content, fb.hits, fb.id, ceil(rownum/5) as page from (
  				select fb.board_no, fb.title, to_char(fb.write_date,'YYYY.MM.DD') as fb.write_date, fb.content, fb.hits, fb.id	 
  				from free_board fb, member m order by fb.ref desc, fb.restep asc
  				)
  			) 
  		where fb.id=m.id and page=1
  		
				select fb.board_no, fb.title, to_char(fb.write_date,'YYYY.MM.DD') write_date, fb.content, fb.hits, fb.id	 
  				from free_board fb order by fb.ref desc, fb.restep asc
