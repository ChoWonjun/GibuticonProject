drop table gibu_friend;
create table gibu_friend(
	my_id varchar2(200) not null,
	friend_id varchar2(200) not null
)

insert into gibu_friend(my_id, friend_id) values ('java', 'java3');

select * from gibu_friend, member where gibu_friend.friend_id=member.id and my_id='java';

delete from gibu_friend where my_id='java' and friend_id='java3';