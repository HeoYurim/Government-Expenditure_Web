CREATE USER U_HAKSA IDENTIFIED BY password;
GRANT CONNECT, RESOURCE, CREATE VIEW TO U_HAKSA;
CONNECT U_HAKSA/password

CREATE TABLE HS_STUDENTS (
	hs_stu_id		varchar2(10),
	class_off_id	varchar2(10) not null,
	hs_prof_id		varchar2(10) not null,
	hs_stu_name		varchar2(15) not null,
	hs_stu_jumin	varchar2(14) not null,
	hs_stu_addr		varchar2(100) not null,
	hs_stu_phnum	varchar2(15) not null,
	hs_stu_email	varchar2(100) not null,
	hs_stu_image	long,
	hs_stu_sub		varchar2(3) not null
);
create table HS_CLASS_OFFICE(
	class_off_id		varchar2(10),
	class_off_name		varchar2(20) not null,
	class_off_phnum		varchar2(15) not null
);
create table HS_PROFESSOR(
	prof_id			varchar2(10),
	prof_name		varchar2(15) not null,
	prof_jumin		varchar2(14) not null,
	prof_addr		varchar2(100) not null,
	prof_phnum		varchar2(15) not null,
	prof_email		varchar2(100) not null,
	prof_image		long,
	class_off_id	varchar2(10) not null,
	hs_stu_id		varchar2(10) not null
);

CREATE TABLE HS_LECTURE	(
	lec_id			varchar2(10),
	lec_name		varchar2(15) not null,
	lec_arch_grade	char(1) not null,
	lec_time		number(1) not null,
	lec_room		varchar2(10) not null,
	prof_id			varchar2(10)
);

create table REGIS_COURSE(
	rc_atten_grade			number(2),
	rc_midterm_grade		number(2),
	re_finalterm_grade		number(2),
	re_else_grade			number(2),
	re_total				number(3),
	re_avg_grade			char(1),
	hs_stu_id				varchar2(10),
	lec_id					varchar2(10),
	prof_id					varchar2(10)
);

insert into HS_CLASS_OFFICE
	values('145','사회복지학과','031-234-5678');
insert into HS_CLASS_OFFICE
	values('146','컴퓨터공학과','031-234-5679');	
insert into HS_PROFESSOR
	values('1234','홍길동','670912-2345668','수원시 권선구','010-4567-8901','sql2@ac.kr',null,'145','04154123');
insert into HS_PROFESSOR
	values('145','고길동','591004-1345668','수원시 권선구','010-9865-1231','sql3@ac.kr',null,'146','04154124');
insert into HS_STUDENTS
	values('04154123','145','1234','서창호','750813-1234567','서울시 성동구','010-1234-5678','sql@naver.com',null,'2-1');
insert into HS_STUDENTS
	values('04154124','146','145','둘리','880116-1273564','수원시 영통구','010-1244-5621','sql2@naver.com',null,'2-2');	
insert into HS_LECTURE
	values('9999','복지론','B',3,'201호','1234');
insert into REGIS_COURSE
	values(20,25,30,25,100,'B','04154123','9999','1234');

alter table HS_CLASS_OFFICE add constraint class_off_id_pk primary key(class_off_id);

alter table HS_PROFESSOR add constraint hs_prof_id_pk primary key(prof_id);
alter table HS_PROFESSOR add constraint hs_prof_class_off_id_fk2 foreign key(class_off_id) references HS_CLASS_OFFICE (class_off_id);

alter table HS_STUDENTS add constraint hs_stu_id_pk primary key(hs_stu_id);
alter table HS_STUDENTS add constraint class_off_id_fk2 foreign key (class_off_id) references HS_CLASS_OFFICE(class_off_id);

alter table HS_STUDENTS add constraint hs_prof_id_fk3 foreign key (hs_prof_id) references HS_PROFESSOR (prof_id);
alter table HS_PROFESSOR add constraint hs_prof_stu_id_fk1 foreign key(hs_stu_id) references HS_STUDENTS (hs_stu_id);

alter table HS_LECTURE add constraint hs_lec_id_pk primary key (lec_id);
alter table HS_LECTURE add constraint hs_lec_prof_id_fk foreign key (prof_id) references HS_PROFESSOR (prof_id);

alter table REGIS_COURSE add constraint rc_stu_id_fk2 foreign key (hs_stu_id) references HS_STUDENTS (hs_stu_id);
alter table REGIS_COURSE add constraint rc_lec_id_fk1 foreign key (lec_id) references HS_LECTURE (lec_id);
alter table REGIS_COURSE add constraint rc_stu_lec_prof_id primary key(hs_stu_id, lec_id, prof_id);


-- alter table HS_STUDENTS add constraint hs_stu_id_fk1 foreign key (hs_stu_id) references HS_PROFESSOR(prof_id);
 
drop table HS_STUDENTS;
drop table HS_CLASS_OFFICE;
drop table HS_PROFESSOR;
drop table HS_LECTURE;
drop table REGIS_COURSE;

select * from HS_STUDENTS
where hs_prof_id = '145';

select * from HS_CLASS_OFFICE
where class_off_name = '컴퓨터공학과';