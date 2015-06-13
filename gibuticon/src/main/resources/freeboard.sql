자유게시판글번호(프라이머리키),제목, 작성일, 글내용, 조회수, 작성자id(fk)

drop table free_board;
create table free_board(
	board_no number primary key,
	title varchar2(50) not null,
	write_date date not null,
	content varchar2(200) not null,
	hits number not null,
	id varchar2(50),
	constraint fk_id foreign key(id) references member
)
create table freeBoard_comment(
	id varchar2(50),
	board_no number,
	write_date date not null,
	comment varchar2(100) not null,
	hits number not null,
	constraint fk_id foreign key(id) references member,
	constraint fk_board_no foreign key(board_no) references free_board,
	constraint pk_freeBoard_comment primary key(id, board_no)
)
alter table free_board add(ref number not null);
alter table free_board add(restep number not null);
alter table free_board add(relevel number not null);

create sequence free_board_sequence;
drop sequence free_board_sequence;

select * from free_board;

insert into free_board values (free_board_sequence.nextval,'whatamidoinghere',sysdate,'whoamiandwhereami',0,'chocamp');
	
select * from free_board where id='chocamp';

delete from free_board where id='chocamp';

delete from free_board where board_no='28';

create table driving_license(
   license_no varchar2(50) primary key,
   member_id varchar2(50),
   license_type varchar2(50) not null,
   license_renewal_term varchar2(50) not null,
   license_issue_date varchar2(50) not null,
   gender varchar2(50) not null,
   constraint fk_member_id foreign key(member_id) references member
)