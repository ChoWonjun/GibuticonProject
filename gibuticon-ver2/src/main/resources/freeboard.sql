-- 자유게시판글번호(프라이머리키),제목, 작성일, 글내용, 조회수, 작성자id(fk)

drop table free_board;

--3.
create sequence free_board_sequence;

alter table free_board add(ref number not null);
--2.
alter table free_board add(restep number not null);
alter table free_board add(relevel number not null);
alter table free_board modify(hits number default 0);

--1.
create table free_board(
	board_no number primary key,
	title varchar2(50) not null,
	write_date date not null,
	content varchar2(200) not null,
	hits number not null,
	id varchar2(50),
	constraint fk_id foreign key(id) references member(id)
)

drop table freeBoard_comment;

--6.
create sequence freeboard_comment_sequence;

--5.
alter table freeBoard_comment modify(hits number default 0);
alter table freeBoard_comment add(ref number not null);
alter table freeBoard_comment add(restep number not null);
alter table freeBoard_comment add(relevel number not null);
--4.
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

