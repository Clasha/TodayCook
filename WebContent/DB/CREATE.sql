drop table member;
delete from RECOMMEND_RECIPE where mnum = 24;
select * from RECOMMEND_RECIPE;
select * from RECOMMEND_COMMENT;
delete from Recipe where mnum = 24;
delete from member where mnum = 24;
/* ȸ�� */
CREATE TABLE Member (
	mnum NUMBER NOT NULL, /* ȸ����ȣ */
	email VARCHAR2(50) NOT NULL, /* ȸ�� �̸��� */
	pwd VARCHAR2(20) NOT NULL, /* ��й�ȣ */
	nick VARCHAR2(20) NOT NULL, /* �г��� */
	last DATE NOT NULL, /* ������ ���ӽð� */
	profilpic VARCHAR2(2000), /* �����ʻ��� */
	CONSTRAINT PK_Member PRIMARY KEY (mnum)	
)segment creation immediate;

delete from Member;
drop sequence seq_member;

select * from member;
drop table recipe;
drop sequence recipe_num;

select * from recipe;
/* ������ */
--drop table recipe cascade constraint;
CREATE TABLE Recipe (
	num NUMBER NOT NULL, /* ������ ��ȣ */
	title VARCHAR2(60) NOT NULL, /* ���� */
	cooktype VARCHAR2(50) NOT NULL, /* �丮���� */
	situation VARCHAR2(50) NOT NULL, /* �丮��Ȳ */
	material VARCHAR2(1000) NOT NULL, /* ��� */
	pay VARCHAR2(100), /* ��� */
	cooktime VARCHAR2(30) NOT NULL, /* �����ð� */
	hardly VARCHAR2(30) NOT NULL, /* ���̵� */
	person varchar2(30) NOT NULL, /* �ο� */
	mnum NUMBER NOT NULL, /* ȸ����ȣ */
	writetime DATE NOT NULL, /* �ۼ��ð� */
	count NUMBER, /* ��ȸ�� */
	recommend NUMBER, /* ��õ��(���ƿ�) */
	tip VARCHAR2(1000), /* �丮�� */
	image VARCHAR2(2000) NOT NULL, /* ��ǥ�̹��� */
	CONSTRAINT PK_Recipe PRIMARY KEY (num),
	CONSTRAINT FK_Member_TO_Recipe FOREIGN KEY (mnum)
		REFERENCES Member (mnum) on delete cascade
)segment creation immediate;

alter table Recipe drop CONSTRAINT FK_Member_TO_Recipe;
alter table recipe add CONSTRAINT FK_Member_TO_Recipe FOREIGN KEY (mnum)
		REFERENCES Member (mnum)
	on delete cascade;
alter table Recipe modify(pay varchar(100));
alter table Recipe modify(title varchar(150));




/* �����Ǵ�� */
CREATE TABLE recipe_comment (
	cnum NUMBER NOT NULL, /* ��۹�ȣ */
	ccomment VARCHAR2(1000) NOT NULL, /* ���� */
	cdate DATE NOT NULL, /* ��¥ */
	mnum NUMBER, /* ȸ����ȣ */
	crecommend NUMBER, /* ��õ�� */
	warning VARCHAR2(50), /* �Ű� */
	num NUMBER, /* ������ ��ȣ */
	CONSTRAINT PK_recipe_comment PRIMARY KEY (cnum),
	CONSTRAINT FK_Recipe_TO_recipe_comment
		FOREIGN KEY (num	)
		REFERENCES Recipe (num) on delete cascade,
	CONSTRAINT FK_Member_TO_recipe_comment FOREIGN KEY (mnum)
		REFERENCES Member (mnum) on delete cascade
)segment creation immediate;


drop table jjim_recipe;
select * from jjim_recipe;
jjim_time DATE
/* �� */
CREATE TABLE JJIM_RECIPE (
	num NUMBER, /* �����ǹ�ȣ */
	mnum NUMBER, /* ȸ����ȣ */
	CONSTRAINT PK_JJIM_RECIPE PRIMARY KEY (num, mnum),
	CONSTRAINT FK_Member_TO_Like FOREIGN KEY (mnum)
		REFERENCES Member (mnum) on delete cascade,
	CONSTRAINT FK_Recipe_TO_Like FOREIGN KEY (num)
		REFERENCES Recipe (num) on delete cascade
)segment creation immediate;

alter table JJIM_RECIPE drop constraint FK_Recipe_TO_Like;
alter table JJIM_RECIPE add constraint FK_Recipe_TO_Like FOREIGN KEY (num)
		REFERENCES Recipe (num) on delete cascade;


drop table jjim_recipe;
select * from JJIM_RECIPE;

/* ���۾˸� */
CREATE TABLE New_Noti (
	mnum NUMBER, /* ȸ����ȣ */
	num NUMBER, /* ������ ��ȣ */
	CONSTRAINT FK_Member_TO_New_Noti FOREIGN KEY (mnum)
		REFERENCES Member (mnum) on delete cascade,
	CONSTRAINT FK_Recipe_TO_New_Noti FOREIGN KEY (num)
		REFERENCES Recipe (num) on delete cascade
)segment creation immediate;



/* �������� */
CREATE TABLE ChefVideo (
	vnum NUMBER NOT NULL, /* ������ȣ */
	chefname VARCHAR2(16) NOT NULL, /* �����̸� */
	videolink VARCHAR2(2000) NOT NULL, /* ������ũ */
	videotitle VARCHAR2(100) NOT NULL, /* �������� */
	uploaddate DATE NOT NULL, /* ���ε峯¥ */
	cvcount NUMBER, /* ��ȸ�� */
	cvrecommend NUMBER, /* ��õ�� */
	CONSTRAINT PK_ChefVideo PRIMARY KEY (vnum)
)segment creation immediate;

/* �丮���� */
CREATE TABLE CookStep (
	num NUMBER NOT NULL, /* ������ ��ȣ */
	step NUMBER(2) NOT NULL, /* �丮���� */
	image VARCHAR2(2000) NOT NULL, /* �̹��� */
	contents VARCHAR2(2000) NOT NULL, /* ���� */
	CONSTRAINT PK_CookStep PRIMARY KEY (num, step),
	CONSTRAINT FK_Recipe_TO_CookStep FOREIGN KEY (num)
		REFERENCES Recipe (num) on delete cascade
)segment creation immediate;

select * from COOKSTEP
/* �����亯�Խñ� */
CREATE TABLE QNA (
	NUM NUMBER NOT NULL, /* �Խñ۹�ȣ */
	mnum NUMBER NOT NULL, /* ȸ����ȣ */
	SUBJECT VARCHAR2(50) NOT NULL, /* ���� */
	REG_DATE DATE NOT NULL, /* ������� */
	CONTENT VARCHAR2(2000) NOT NULL, /* �۳��� */
	ANWSER VARCHAR2(2000), /* �亯���� */
	CONSTRAINT PK_QNA PRIMARY KEY (NUM),
	CONSTRAINT FK_Member_TO_QNA FOREIGN KEY (mnum)
		REFERENCES Member (mnum) on delete cascade
)segment creation immediate;

alter table qna drop CONSTRAINT FK_Member_TO_QNA;
alter table qna add CONSTRAINT FK_Member_TO_QNA FOREIGN KEY (mnum)
		REFERENCES Member (mnum) on delete cascade;

		
		
/* 레시피신고 */
CREATE TABLE warning_Recipe (
   mnum NUMBER NOT NULL, /* 회원번호 */
   num NUMBER NOT NULL, /* 레시피 번호 */
   warn_time DATE NOT NULL, /* 신고시간 */
   CONSTRAINT PK_warning_Recipe
      PRIMARY KEY (mnum,num),
   CONSTRAINT FK_Member_TO_warning_Recipe
      FOREIGN KEY (mnum) REFERENCES Member (mnum) on delete cascade,
   CONSTRAINT FK_Recipe_TO_warning_Recipe
      FOREIGN KEY (num) REFERENCES Recipe (num) on delete cascade
);

/* 댓글신고 */
CREATE TABLE warning_Comment (
   mnum NUMBER NOT NULL, /* 회원번호 */
   cnum NUMBER NOT NULL, /* 댓글번호 */
   warn_time DATE NOT NULL, /* 신고시간 */
   CONSTRAINT PK_warning_Comment
      PRIMARY KEY (mnum, cnum),
   CONSTRAINT FK_re_co_TO_warning_Comment
      FOREIGN KEY (cnum) REFERENCES recipe_comment (cnum) on delete cascade,
   CONSTRAINT FK_Member_TO_warning_Comment
      FOREIGN KEY (mnum) REFERENCES Member (mnum)on delete cascade
);



/* 댓글 신고 */
create or replace trigger t_warning_comment
   after insert on warning_Comment
   for each row 
begin
   update recipe_comment set warning = warning+1 where cnum=:new.cnum;
end;
/		
--------------------------------------------------------------
-- ������
/* ��� ��ȣ ������ */
		
drop sequence seq_member;
drop sequence seq_recipe;
drop sequence seq_commment;
drop sequence seq_qna;
		
create sequence seq_member
increment by 1
start with 1
maxvalue 999999;

/* ������ ��ȣ ������ */
create sequence seq_recipe
increment by 1
start with 1
maxvalue 999999;

drop sequence seq_recipe;

/* ��� ��ȣ ������ */
create sequence seq_commment
increment by 1
start with 1
maxvalue 999999;

/* �����亯�Խñ� ��ȣ ������ */
create sequence seq_qna
increment by 1
start with 1
maxvalue 999999;


-------------------------------------------------
-- ��

select * from member;
	
/* member 와 recipe 조인 -- > 최초 1회 시행, 다음부터는 뷰만 실행한다. */
create or replace view view_member_recipe as
select m.mnum mnum, m.email email, m.pwd pwd, m.nick nick, m.last last,
	m.profilpic profilpic, r.num num, r.title title, r.cooktype cooktype,
	r.situation situation, r.material material, r.pay pay, r.hardly hardly,
	r.person person, r.writetime writetime, r.count count, r.recommend recommend,
	r.tip tip, r.image image, r.cooktime cooktime
	from member m, recipe r where m.mnum=r.mnum;

drop view view_member_recipe;

select * from recipe;
drop view view_member_recipe;
select * from view_member_recipe;
/*뷰로부터 닉, 회원넘버, 레시피 제목, 레시피 작성일 가져오기 */
select nick, mnum, title, writetime, image from view_member_recipe;
select num, nick, mnum, title, writetime, image from view_member_recipe order by writetime;
/*where문 확인용*/
select num, nick, mnum, title, writetime, image from view_member_recipe where num=2 and mnum=1;

/*지훈 추가*/
select num, nick, mnum, title, writetime, image, cooktype, situation from view_member_recipe order by writetime;
select num, nick, mnum, title, writetime, image, cooktype, situation, count from view_member_recipe order by writetime;


select num, nick, mnum, title, writetime, image, cooktype, situation from view_member_recipe where cooktype like '%메인반찬%' order by writetime;
select num, nick, mnum, title, writetime, image, cooktype, situation from view_member_recipe where cooktype like '%간식/디저트%' order by writetime;

select num, nick, mnum, title, writetime, image, cooktype, situation  
from view_member_recipe where material like '%소고기%' or title like '%소고기%' order by writetime;

/*페이징 처리를 위한 count*/
select count(*)from view_member_recipe;

/*jjin_recipe 검색*/
select * from jjim_recipe;

/*jjim recipe 가져오기 - jjim레시피에서 mnum가 가진 num과 일치하는 레시피 목록*/
select r.title title, r.image image, r.mnum mnum, r.num num from RECIPE r where r.num in
(select num from JJIM_RECIPE where mnum=1);


select * from qna;

select * from qna where num=23;

select q.num num, q.mnum mnum, q.subject subject, q.reg_date regdate, 
q.content content, q.anwser aswser, m.nick nick from member m, qna q where
m.mnum=q.mnum and q.num=23;

select q.num num, q.mnum mnum, q.subject subject, q.reg_Date reg_date,
q.content content, q.anwser anwser, m.nick nick from MEMBER m, QNA q where 
m.mnum=q.mnum order by reg_Date

select * from jjim_recipe;
select num from JJIM_RECIPE where mnum=1;

CREATE VIEW VIEW_MEMBER_JJIM_RECIPE AS
SELECT R.NUM NUM, JJ.MNUM JJIM_MNUM, R.MNUM WRITE_MNUM, R.TITLE TITLE, R.COOKTYPE COOKTYPE, R.SITUATION SITUATION, 
	R.MATERIAL MATERIAL, R.PAY PAY, R.COOKTIME COOKTIME, R.HARDLY HARDLY, R.PERSON PERSON,
	R.WRITETIME WRITETIME, R.COUNT COUNT, R.RECOMMEND RECOMMEND, R.TIP TIP, R.IMAGE IMAGE 
FROM JJIM_RECIPE JJ, RECIPE R
WHERE JJ.NUM = R.NUM;


select * from member;
/*오늘의 새글 알림*/
/* 로그인한 사람의 마지막 로그인시각을 가져와서 레시피가 쓰여진 시간과 비교한다*/
select r.num num, r.title title, r.image image, r.writetime writetime, m.last last 
from recipe r, member m where r.writetime > m.last and m.mnum=24 order by r.writetime desc; 




select r.title "타이틀", count(wr.num) "신고수", m.email "작성자" from recipe r, warning_Recipe wr,
member b where r.num = wr.num and r.mnum = m.mnum group by r.mnum and m.mnum;


select r.num, r.title, r.writeTime, m.nick ,m.email,
(select count(wr.num) from warning_recipe wr where r.num=wr.num) wcount,
(select warn_time from warning_recipe wr where r.num = wr.num) warningTime
from recipe r, member m where r.mnum = m.mnum and m.nick like '%유슬아%' order by wcount desc;

select r.num, r.title, r.writeTime, m.nick ,m.email, r.recommend,
(select count(wr.num) from warning_recipe wr where r.num=wr.num) wcount,
(select warn_time from warning_recipe wr where r.num = wr.num) warningTime,
(select count(rc.num) from recipe_comment rc where r.num=rc.num) recount
from recipe r, member m where r.mnum = m.mnum;

select r.num, r.title, r.writeTime, m.nick ,m.email, r.recommend,
(select count(wr.num) from warning_recipe wr where r.num=wr.num) wcount,
(select warn_time from warning_recipe wr where r.num = wr.num) warningTime,
(select count(rc.num) from recipe_comment rc where r.num=rc.num) recount
from recipe r, member m where r.mnum = m.mnum and r.title like '%테스트%';


select * from warning_recipe;
select * from recipe;
select * from member;


ALTER TABLE recommend_recipe ADD CONSTRAINT FK_Recipe_TO_re_reci
FOREIGN KEY (NUM) REFERENCES Recipe (NUM) on delete cascade;

ALTER TABLE recommend_recipe ADD CONSTRAINT FK_Recipe_TO_re_reci
FOREIGN KEY (num) REFERENCES Recipe (num);

Alter table RECOMMEND_RECIPE drop CONSTRAINT FK_Recipe_TO_re_reci;


select c.cnum "댓글번호", c.ccomment "댓글내용", c.mnum "댓글쓴이번호", 
m.email "이메일", m.nick "닉", c.warning "신고횟수", wc.mnum "신고자번호", 
c.crecommend "추천횟수", rc.mnum "추천자번호"
from RECIPE_COMMENT c, MEMBER m, WARNING_COMMENT wc, RECOMMEND_COMMENT rc
where c.mnum = m.mnum and c.cnum = wc.cnum(+) and c.cnum = rc.cnum(+);

select c.cnum cnum, c.ccomment ccomment, c.mnum mnum, 
m.email email, m.nick nick, c.warning cwarning, wc.mnum mnum, 
c.crecommend crecommend, rc.mnum mnum
from RECIPE_COMMENT c, MEMBER m, WARNING_COMMENT wc, RECOMMEND_COMMENT rc
where c.mnum = m.mnum and c.cnum = wc.cnum(+) and c.cnum = rc.cnum(+);


select c.cnum cnum, c.ccomment ccomment, c.mnum cmnum,
m.email email, m.nick nick, c.warning cwarning, wc.mnum wmnum,
c.crecommend crecommend, rc.mnum rmnum
from RECIPE_COMMENT c, MEMBER m, WARNING_COMMENT wc, RECOMMEND_COMMENT rc 
where c.mnum = m.mnum and c.cnum = wc.cnum(+) and c.cnum = rc.cnum(+);