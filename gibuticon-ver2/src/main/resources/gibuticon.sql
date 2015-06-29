drop sequence gift_no_seq;
create sequence gift_no_seq nocache;

drop table gibuticon;
create table gibuticon (
	gift_no number primary key,
	gift_date date not null,
	price number not null,
	sender varchar2(100) not null,
	reciever varchar2(100),
	pin_no number unique not null,
	constraint fk_sender foreign key(sender) references member(id),
	constraint fk_reciever foreign key(reciever) references member(id)
)

-- 회원에게 선물할 때 수신자까지 입력
insert into gibuticon values (gift_no_seq.nextval, sysdate, 100, 'chocamp', 'amorce27', 11435295766495);

-- 비회원에게 메일로 선물할 때 수신자 비우고 입력
insert into gibuticon (gift_no, gift_date, price, sender, pin_no) 
	values (gift_no_seq.nextval, sysdate, 100, 'chocamp', 21435304416218);