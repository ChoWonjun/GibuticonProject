  create sequence gibu_fund_seq;
  create table gibu_fund(
  	fund_no number primary key,
  	fund_name varchar2(200) not null,
  	proposal varchar2(200) not null,
  	homepage varchar2(200),
  	cur_sum number default 0,
  	goal_sum number not null,
  	participant number default 0,
  	due_date date not null,
  	content clob not null,
  	hits number default 0
  )
  
  drop table gibu_fund;
  
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
  