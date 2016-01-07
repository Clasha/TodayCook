insert into member values 
(seq_member.nextval, 'a@email', 'pwd', 'nick', sysdate, '이미지');
insert into member values 
(seq_member.nextval, 'b@email', 'pwd', 'nick2', sysdate, '이미지1');
insert into member values 
(seq_member.nextval, 'c@email', 'pwd', 'nick3', sysdate, '이미지2');
insert into member values 
(seq_member.nextval, 'd@email', 'pwd', 'nick4', sysdate, '이미지3');
insert into member values 
(seq_member.nextval, 'e@email', 'pwd', 'nick5', sysdate, '이미지4');

--rollback 
--commit

insert into recipe values(seq_recipe.nextval, '제목1', '종류1', '상황1', '재료', 10, 10, '난이도',
	'인원', 1, sysdate, 1, 1, '요리팁', '대표이미지' );
insert into recipe values(seq_recipe.nextval, '제목2', '종류1', '상황1', '재료', 10, 10, '난이도',
	'인원', 1, sysdate, 1, 1, '요리팁', '대표이미지' );
insert into recipe values(seq_recipe.nextval, '제목3', '종류1', '상황1', '재료', 10, 10, '난이도',
	'인원', 10, sysdate, 1, 1, '요리팁', '대표이미지' );
insert into recipe values(seq_recipe.nextval, '제목4', '종류1', '상황1', '재료', 10, 10, '난이도',
	'인원', 10, sysdate, 1, 1, '요리팁', '대표이미지' );
insert into recipe values(seq_recipe.nextval, '제목5', '종류1', '상황1', '재료', 10, 10, '난이도',
	'인원', 11, sysdate, 1, 1, '요리팁', '대표이미지' );

select * from recipe;
select m.mnum, r.num, r.title from member m, recipe r where m.mnum=r.mnum;
	