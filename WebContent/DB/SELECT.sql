select * from member;
select * from recipe;


--create or replace view view_member_recipe as
select m.mnum mnum, m.email email, m.pwd pwe, m.nick nick, m.last last,
	m.profilpic profilpic, r.num num, r.title title, r.cooktype cooktype,
	r.situation situation, r.material material, r.pay pay, r.hardly hardly,
	r.person person, r.writetime writetime
	from member m, recipe r where m.mnum=r.mnum;

	
select * from view_member_recipe where mnum=1;
