select * from member;

/* ȸ�� */
CREATE TABLE Member (
	mnum NUMBER NOT NULL, /* ȸ����ȣ */
	email VARCHAR2(50) NOT NULL, /* ȸ�� �̸��� */
	pwd VARCHAR2(20) NOT NULL, /* ��й�ȣ */
	nick VARCHAR2(20) NOT NULL, /* �г��� */
	last DATE NOT NULL, /* ������ ���ӽð� */
	profilpic VARCHAR2(2000), /* �����ʻ��� */
	CONSTRAINT PK_Member	PRIMARY KEY (mnum)
)segment creation immediate;

create sequence Member_num;
drop sequence Member_num;

select * from recipe;
drop table recipe;
/* ������ */
CREATE TABLE Recipe (
	num NUMBER NOT NULL, /* ������ ��ȣ */
	title VARCHAR2(60) NOT NULL, /* ���� */
	cooktype VARCHAR2(50) NOT NULL, /* �丮���� */
	situation VARCHAR2(50) NOT NULL, /* �丮��Ȳ */
	material VARCHAR2(1000) NOT NULL, /* ��� */
	pay VARCHAR2(8), /* ��� */
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
	CONSTRAINT FK_Member_TO_Recipe FOREIGN KEY (	mnum	)
		REFERENCES Member (mnum)
)segment creation immediate;

create sequence Recipe_num;
drop sequence Recipe_num;

drop table recipe_comment;
select * from recipe_comment;
/* �����Ǵ�� */
CREATE TABLE recipe_comment (
	cnum NUMBER NOT NULL, /* ��۹�ȣ */
	ccomment VARCHAR2(1000) NOT NULL, /* ���� */
	cdate DATE NOT NULL, /* ��¥ */
	mnum NUMBER, /* ȸ����ȣ */
	crecommend NUMBER, /* ��õ�� */
	warning NUMBER, /* �Ű� */
	num NUMBER, /* ������ ��ȣ */
	CONSTRAINT PK_recipe_comment PRIMARY KEY (cnum),
	CONSTRAINT FK_Recipe_TO_recipe_comment
		FOREIGN KEY (num	)
		REFERENCES Recipe (num),
	CONSTRAINT FK_Member_TO_recipe_comment FOREIGN KEY (mnum)
		REFERENCES Member (mnum)
);

/* �� */
CREATE TABLE JJIM_RECIPE (
	num NUMBER, /* �����ǹ�ȣ */
	mnum NUMBER, /* ȸ����ȣ */
	CONSTRAINT FK_Member_TO_Like FOREIGN KEY (mnum)
		REFERENCES Member (mnum),
	CONSTRAINT FK_Recipe_TO_Like FOREIGN KEY (num)
		REFERENCES Recipe (num)
);

/* ���۾˸� */
CREATE TABLE New_Noti (
	mnum NUMBER, /* ȸ����ȣ */
	num NUMBER, /* ������ ��ȣ */
	CONSTRAINT FK_Member_TO_New_Noti FOREIGN KEY (mnum)
		REFERENCES Member (mnum),
	CONSTRAINT FK_Recipe_TO_New_Noti	FOREIGN KEY (num)
		REFERENCES Recipe (num)
);

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
);

/* �丮���� */
CREATE TABLE CookStep (
	num NUMBER NOT NULL, /* ������ ��ȣ */
	step NUMBER(2) NOT NULL, /* �丮���� */
	image VARCHAR2(2000) NOT NULL, /* �̹��� */
	contents VARCHAR2(2000) NOT NULL, /* ���� */
	CONSTRAINT PK_CookStep PRIMARY KEY (num, step),
	CONSTRAINT FK_Recipe_TO_CookStep FOREIGN KEY (num)
		REFERENCES Recipe (num)
);

select r.cnum,r.ccomment,r.cdate,r.mnum,r.crecommend,r.warning,r.num,m.nick,m.profilpic from recipe_comment r,Member m where r.mnum = m.mnum AND num = num;
