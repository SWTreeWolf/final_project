select count(*) from noboard

select * from pay order by pay_num
update members set point = 0 where id = 'zipper'
update members set mem_grade = 'Bronze' where id = 'zipper'
select * from cart
select * from members where id = 'zipper'
delete from cart where id = 'zipper'

select b.* from
		(select rownum as rm, a.* from(
		select b.* from (select rownum r,a.* from (select pp.*,(select count(*) from pay  where pay_num=pp.pay_num group by pay_num)pay_total_count  from pay pp,product pro where pp.goods_code=pro.goods_code)a)b 
		where r in (select max(b.r) from (select rownum r,a.* from (select distinct * from pay)a)b group by pay_num ) and id='non'
		)a)b 
	  	
select b.* from
		(select rownum as rm, a.* from(	select pro.goods_code, pro.goods_name, pro.goods_price, pro.goods_group1,
	pro.goods_group2, pro.goods_content, pro.total_count, pic.goods_main, pic.goods_detail from product pro,picture pic
	 where pro.goods_code=pic.goods_code order by pro.goods_code desc)a)b 
	  		
select count(*) from		
		(select distinct pay_num,total_price,id,rec_name,rec_phone,zipcode,addr1,addr2,TO_CHAR(pay_date,'YYYY-MM-DD')as pay_datet,pay_state
		from pay where id='zipper' order by pay_num)a
	 

		
 	
select b.* from (select rownum as rm,a.*,(select count(*) from pay  where pay_num=a.pay_num group by pay_num)pay_total_count from		
(select distinct pay_num,total_price,id,rec_name,rec_phone,zipcode,addr1,addr2,TO_CHAR(pay_date,'YYYY-MM-DD')as pay_date,pay_state
from pay where id='zipper' order by pay_num)a)b
where b.rm >= 9 and b.rm<= 16

	  	select rownum,a.*,(select count(*) from pay  where pay_num=a.pay_num group by pay_num)pay_total_count from		
		(select distinct pay_num,total_price,id,rec_name,rec_phone,zipcode,addr1,addr2,TO_CHAR(pay_date,'YYYY-MM-DD')as pay_datet,pay_state
		from pay where id='non' order by pay_num)a
	  	
select * from NOTICE
select * from NOBOARD
select * from FNQ

select b.* from 
	     (select rownum as rm, a.* from
	     (select c.*,(select count(*) from commureply where commuNum=c.commuNum)as 
         replycnt from community c where category='메이크업') a)b 
	     where b.rm>=#{startRow} and b.rm<=#{endRow}
	     order by commuNum desc

select b.* from
(select rownum as rm, a.* from(
select b.* from (select rownum r,a.* from (select pp.*,(select count(*) from pay 
where pay_num=pp.pay_num group by pay_num)pay_total_count 
from pay pp,product pro where pp.goods_code=pro.goods_code)a)b 
where r in (select max(b.r) from (select rownum r,a.* from (select * from pay)a)b group by pay_num )
)a)b 
where b.rm >= 0 and b.rm<= 3

 where id='zipper' 
select max(b.r) from (select rownum r,a.* from (select * from pay)a)b where id='zipper' group by pay_num 


select distinct p.*,pic.goods_main,(select goods_color from options where goods_code2=p.goods_code2) from pay
p,picture pic where p.goods_code=pic.goods_code and p.pay_num=1


select * from picture
select * from product
select * from options
select * from pay

select * from community

      insert into community(commuNum,nickname,id,category,subject,content) 
      values(commu_rno_seq.nextval,'ㄴㅇㅇ','zipper','기타','애배배','ㅇㅂㅂ')


select * from pay where id='zipper'

create or replace trigger cnt_update
after update on options
for each row
begin
update product set total_count =total_count -+:old.goods_count + :new.goods_count
where goods_code = :new.goods_code;
end;
/
create or replace trigger sel_update
after update on options
for each row
begin
update product set sel_count = sel_count -+:old.opt_sel_count + :new.opt_sel_count
where goods_code = :new.goods_code;
end;
/

create or replace trigger cnt_delete
after delete on options
for each row
begin
update product set total_count = total_count -+:old.goods_count
where goods_code = :old.goods_code;
end;
/

create or replace trigger price_update
after update on product
for each row
begin
update cart set goods_price = :new.goods_price
where goods_code = :new.goods_code;
end;
/


create or replace trigger add_option
after insert on options
for each row
begin
update product set total_count = total_count +:new.goods_count
where goods_code = :new.goods_code;
end;
/

-- 관리자가 상품 삭제시 카트에서도 사라지게 하기
create or replace trigger product_delete
after delete on product
for each row
begin
delete from cart
where goods_code = :old.goods_code;
end;
/

-- 회원정보 수정 시 review_board 닉네임 수정
create or replace trigger member_update
after update on members
for each row
begin
update review set nickname= :new.nickname
where id=:old.id;    
end;
/

-- 회원정보 수정 시 커뮤니티 닉네임 수정
create or replace trigger member_community_update
after update on members
for each row
begin
update community set nickname= :new.nickname
where id=:old.id;
end;
/

-- 제품 삭제시 해당 제품 리뷰 삭제
create or replace trigger product_delete
after delete on product
for each row
begin
delete from review
where goods_code = :old.goods_code;
end;
/

delete from cart where id='zipper' and goods_code=2
 select * from cart
select * from members
select * from product
delete from members where mem_group = 'naver'
select cart_num from cart where id='tlaxowns007' and goods_code=2
select * from cart where id='zipper' and 
select * from review
 select * from product
 select * from options
 select * from PICTURE
 update product set total_count =13 where goods_code = 1
 
 select sum(goods_count) from options where goods_code = 4
 se
  select * from picture
 select SUM(goods_count) from options where goods_code = 3;
 update product set  
insert into product values (1,'메이크업0',30000,'아이','리무버','7-Free',30);
insert into product values (2,'메이크업1',40000,'아이','리무버','7-Free',30);
insert into product values (3,'메이크업2',50000,'아이','리무버','7-Free',30);
insert into product values (4,'메이크업3',60000,'아이','리무버','7-Free',30);
insert into product values (5,'메이크업4',70000,'얼굴','리무버','7-Free',30);
insert into product values (6,'메이크업5',30000,'아이','리무버','7-Free',30);
insert into product values (7,'메이크업6',10000,'아이','리무버','7-Free',30);
insert into product values (8,'메이크업7',50000,'아이','리무버','7-Free',30);
insert into product values (9,'메이크업8',10000,'아이','리무버','7-Free',30);
insert into product values (10,'메이크업10',50000,'아이','리무버','7-Free',30);
insert into product values (11,'메이크업11',50000,'아이','리무버','7-Free',30);
insert into product values (12,'메이크업12',50000,'아이','립스틱','7-Free',30);
insert into product values (13,'메이크업13',50000,'아이','행주','7-Free',30);
insert into product values (14,'메이크업14',50000,'립스틱','아니','7-Free',30);
insert into product values (15,'메이크업15',50000,'립스틱','빨간','7-Free',30);
insert into product values (16,'메이크업16',50000,'립스틱','블루','7-Free',30);

insert into members(id,password,name,nickname,mem_group) values('admin','admin','admin','admin','salon');

create sequence review_seq 
start with 1
increment by 1
nocache
nocycle;

select * from members
select * from pay order by pay_num

insert into OPTIONS values(1,'메이크업0','RED',5);
insert into OPTIONS values(2,'메이크업1','BROWN',2);
insert into OPTIONS values(3,'메이크업2','ORANGE',3);
insert into OPTIONS values(4,'메이크업3','GREEN',4);
insert into OPTIONS values(5,'메이크업4','BLUE',5);
insert into OPTIONS values(6,'메이크업5','PINK',1);

insert into OPTIONS values(14,'메이크업14','HOTPINK',2);
insert into OPTIONS values(14,'메이크업14','BROWN',6);
insert into OPTIONS values(14,'메이크업14','SKYBLUE',4);
insert into OPTIONS values(15,'메이크업15','PINK',5);

insert into PICTURE values(1,'메이크업0','main.png','detail.png');
insert into PICTURE values(2,'메이크업1','main.png','detail.png');
insert into PICTURE values(3,'메이크업2','main.png','detail.png');
insert into PICTURE values(4,'메이크업3','main.png','detail.png');
insert into PICTURE values(5,'메이크업4','main.png','detail.png');
insert into PICTURE values(6,'메이크업5','main.png','detail.png');
insert into PICTURE values(7,'메이크업6','main.png','detail.png');
insert into PICTURE values(8,'메이크업7','main.png','detail.png');
insert into PICTURE values(9,'메이크업8','main.png','detail.png');
insert into PICTURE values(10,'메이크업10','main.png','detail.png');
insert into PICTURE values(11,'메이크업11','main.png','detail.png');
insert into PICTURE values(12,'메이크업12','main.png','detail.png');
insert into PICTURE values(13,'메이크업13','main.png','detail.png');
insert into PICTURE values(14,'메이크업14','main.png','detail.png');
insert into PICTURE values(15,'메이크업15','main.png','detail.png');
insert into PICTURE values(16,'메이크업16','main.png','detail.png');
	select * from picture where goods_code = 1;
	select * from picture where goods_code = 2;
	select * from picture where goods_code = 3;
	select * from picture where goods_code = 4;
	select * from picture where goods_code = 5;
	select * from picture where goods_code = 6;
	select * from picture where goods_code = 7;
	select * from picture where goods_code = 8;
	select * from picture where goods_code = 9;
	select * from picture where goods_code = 10;
	select * from picture where goods_code = 11;
	select * from picture where goods_code = 12;
	select * from picture where goods_code = 13;
	select * from picture where goods_code = 14;
	select * from picture where goods_code = 15;
	select * from picture where goods_code = 16;
select * from PICTURE
select * from product
select * from options
select * from cart where id='zipper'
select * from product where goods_code = 8
select * from members
select * from commureply
delete from commureply where replywriter IS NULL

select * from noboard

select * from eventboard;
delete from eventboard where event_num=43;


update members set point=10000 where id='non'
select * from members where id='zipper'

select id,password from members where name='확인' and email='mmmm@naver.com'

select * from members where mem_group = 'kakao';

update members set 