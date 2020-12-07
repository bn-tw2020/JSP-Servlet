create table member(
	id varchar(15),
	password varchar(10),
	name varchar (10),
	age int,
	gender varchar(6),
	email varchar(30),
	primary key(id)

);

desc member;
select * from member;

insert into member values('aaa', '1111','홍길동', 20, 'male', 'hone@sch.ac.kr');
insert into member values('bbb', '1111','강나라', 30, 'male', 'aone@sch.ac.kr');
insert into member values('ccc', '1111','윤소라', 32, 'male', 'bone@sch.ac.kr');
insert into member values('ddd', '1111','김하나', 27, 'male', 'done@sch.ac.kr');
insert into member values('eee', '1111','박소라', 12, 'female', 'eone@sch.ac.kr');
