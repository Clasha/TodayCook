insert into member values 
(seq_member.nextval, 'a@email', 'pwd', 'nick', sysdate, '�̹���');
insert into member values 
(seq_member.nextval, 'b@email', 'pwd', 'nick2', sysdate, '�̹���1');
insert into member values 
(seq_member.nextval, 'c@email', 'pwd', 'nick3', sysdate, '�̹���2');
insert into member values 
(seq_member.nextval, 'd@email', 'pwd', 'nick4', sysdate, '�̹���3');
insert into member values 
(seq_member.nextval, 'e@email', 'pwd', 'nick5', sysdate, '�̹���4');

--rollback 
--commit

insert into recipe values(seq_recipe.nextval, '����1', '����1', '��Ȳ1', '���', 10, 10, '���̵�',
	'�ο�', 1, sysdate, 1, 1, '�丮��', '��ǥ�̹���' );
insert into recipe values(seq_recipe.nextval, '����2', '����1', '��Ȳ1', '���', 10, 10, '���̵�',
	'�ο�', 1, sysdate, 1, 1, '�丮��', '��ǥ�̹���' );
insert into recipe values(seq_recipe.nextval, '����3', '����1', '��Ȳ1', '���', 10, 10, '���̵�',
	'�ο�', 10, sysdate, 1, 1, '�丮��', '��ǥ�̹���' );
insert into recipe values(seq_recipe.nextval, '����4', '����1', '��Ȳ1', '���', 10, 10, '���̵�',
	'�ο�', 10, sysdate, 1, 1, '�丮��', '��ǥ�̹���' );
insert into recipe values(seq_recipe.nextval, '����5', '����1', '��Ȳ1', '���', 10, 10, '���̵�',
	'�ο�', 11, sysdate, 1, 1, '�丮��', '��ǥ�̹���' );

select * from recipe;
select m.mnum, r.num, r.title from member m, recipe r where m.mnum=r.mnum;
	