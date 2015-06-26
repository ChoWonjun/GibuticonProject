  drop sequence gibu_fund_seq;
  create sequence gibu_fund_seq;
  
  drop table gibu_fund;
  create table gibu_fund(
  	fund_no number primary key,
  	fund_name varchar2(200) not null,
  	proposal varchar2(200) not null,
  	homepage varchar2(200),
  	cur_sum number default 0,
  	goal_sum number not null,
  	participant number default 0,
  	start_date date not null,
  	due_date date not null,
  	content clob not null,
  	hits number default 0
  )
  
  ALTER TABLE gibu_fund ADD category varchar2(200) not null;
  
  insert into gibu_fund(fund_no,fund_name,proposal,
  									homepage,goal_sum,due_date,content)
  values(gibu_fund_seq.nextval,'희망모금','불우이웃돕기','hyodols.info',1000,'2015-06-20','효섭이를 도와주세요');
   
  
  select fund_no fundno, fund_name fundname, proposal, homepage,
  			cur_sum cursum, goal_sum goalsum, participant, due_date duedate,
  			content, hits from gibu_fund
  
  select * from gibu_fund where fund_no=1;
  
  update gibu_fund set hits=hits+1 where fund_no=1
  
  update gibu_fund set participant_count=participant_count+1 where fund_no=1
  
  update gibu_fund set cur_sum=cur_sum+10 where fund_no=1
  
  delete from gibu_fund where fund_no=25
  
 select * from(
  select fundno, fundname, proposal, homepage, cursum, goalsum, participant, duedate, content, hits, ceil(rownum/5) as page from
(select fund_no fundno, fund_name fundname, proposal, homepage,
  	cur_sum cursum, goal_sum goalsutm, participant, due_date duedate,
  	content, hits from gibu_fund order by fund_no desc))where page=1
  	
		select page from(
			select fund_no fundno, ceil(rownum/5) as page from(
				select fund_no from gibu_fund order by fund_no desc
			)
		) where fundno=22


drop sequence fund_photo_seq;
create sequence fund_photo_seq;
drop table fund_photo;
create table fund_photo(
	photo_no number primary key,
	org_name varchar2(200) not null,
	real_name varchar2(200) not null,
	fund_no number,
	constraint fk_fund_no foreign key(fund_no) references gibu_fund
)

insert into fund_photo values (fund_photo_seq.nextval,'','',1);

select * from fund_photo where fund_no = 1 order by photo_order asc;

update fund_photo set org_name='' , real_name='' where photo_no = 1;

--  select no,writer,title,time_posted,hits from(
--	select no,writer,title,time_posted,hits,ceil(rownum/5) as page from(
--		select no,writer,title,to_char(time_posted,'YYYY.MM.DD') as time_posted,hits from board_inst order by no desc
--		)
--	) where page=?
  
  
--  
-- private String fundNo;	
--	private String fundName;
--	private String proposal;
--	private String homepage;
--	private String curSum;
--	private String goalSum;
--	private String participantCount;
--	private Date dueDate;
--	private String content;
--	private int hits;
--  


drop table donation_history;
create table donation_history(
	history_no number primary key,
	fund_no number not null,
	member_id varchar2(200),
	donation_time date not null,
	amount number not null,
	constraint fk_don_his_member foreign key(member_id) references member(id),
	constraint fk_don_his_fund foreign key(fund_no) references gibu_fund(fund_no)
)

create sequence donation_history_seq nocache;

insert into donation_history(history_no, fund_no, member_id, donation_time, amount)
values (donation_history_seq.nextval, 22, 'java', sysdate, 100);
-- 'java' 아이디의 사용자가 22번 기부함에 100 포인트를 기부

drop table charge_history;

create table charge_history(
	history_no number primary key,
	member_id varchar2(200),
	charge_time date not null,
	payment_type varchar2(200) not null,
	amount number not null,
	constraint fk_charge_his_member foreign key(member_id) references member(id)
)

create sequence charge_history_seq nocache;

insert into charge_history(history_no, member_id, charge_time, payment_type, amount)
values(charge_history_seq.nextval, 'java', sysdate, 'credit', 200)
--'java'아이디의 사용자가 신용카드로 200 포인트를 충전

drop table gibu_fund_comment

create table gibu_fund_comment(
	comment_no number primary key,
	fund_no number not null,
	member_id varchar2(200) not null,
	text varchar2(200) not null,
	comment_time date not null,
	constraint fk_fund_comment_member foreign key(member_id) references member(id),
	constraint fk_fund_comment_fund foreign key(fund_no) references gibu_fund(fund_no)
)

create sequence gibu_fund_comment_seq nocache;

insert into gibu_fund_comment(comment_no,fund_no,member_id,text,comment_time)
values(gibu_fund_comment_seq.nextval,81,'java','기부를 합시다',sysdate)
-- 'java' 사용자가 81번 기부함에 '기부를 합시다' 라는 내용의 댓글을 입력


 select * from(
  select commentno, fundno, text, commenttime, id, name, ceil(rownum/5) as page from
(select co.comment_no commentno, co.fund_no fundno, co.text, co.comment_time commenttime,
  	co.member_id id, mem.name name from gibu_fund_comment co, member mem where co.member_id=mem.id order by comment_no desc
  	))
  	where page=1 and fundno=81



select * from(
	select commentno, fundno, text, commenttime, member_id, id, name, ceil(rownum/5) as page from(
		select co.comment_no commentno, co.fund_no fundno, co.text, co.comment_time commenttime,
  					co.member_id, mem.id, mem.name name
  		from gibu_fund_comment co, member mem
  		order by comment_no desc
  	) where member_id=id
)where page=2 and fundno=81

select RANK() OVER (ORDER BY rankval desc) as rank, memberid, rankval from(
	select member_id memberid, totalamount rankval from(
		select member_id, sum(AMOUNT) as totalamount
		from DONATION_HISTORY
		group by DONATION_HISTORY.MEMBER_ID
	)
)

select RANK() OVER (ORDER BY rankval desc) as rank, memberid, rankval from(
	select member_id memberid, fundcount rankval from(
		select member_id, count(distinct(fund_no)) fundcount
		from DONATION_HISTORY
		group by DONATION_HISTORY.MEMBER_ID
	)
)

--전체 기부자수
select count(distinct(member_id)) from donation_history

--전체 기부액
select sum(amount) from donation_history

--연도별 기부자수
select count(distinct(member_id)) from donation_history where to_char(donation_time,'yyyy')=2015

--연도별 기부액
select sum(amount) from donation_history where to_char(donation_time,'yyyy')=2015

