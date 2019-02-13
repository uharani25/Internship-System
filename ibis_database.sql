create database ibis;
use ibis;
create database bis;


use bis;



create table persons(
person_id int(10) primary key references persons(person_id),
name varchar(20),
cell_phone int(10),
email varchar(20),
constraint persons_pk unique (person_id));


/*

drop table students;*/


create table students(
person_id int(10) primary key,
student_address varchar(20),
student_minor varchar(10),
student_major varchar(10),
grad_year year(4),
foreign key (person_id) references persons(person_id) 
);

/*drop table faculty;*/

create table faculty(
person_id int(10) primary key ,
faculty_type varchar(20),
foreign key (person_id) references persons(person_id));




insert into persons values( 1, "priyanka",980282000,"pmanusan@uncc.edu");

insert into persons values( 2, "bhavya",978906547,"bgedi@uncc.edu");

insert into persons values( 3, "uha",987654321,"unupur@uncc.edu");

insert into persons values( 4, "ming",879678968,"mingxi@uncc.edu");

insert into persons values( 5, "nirs",956255256,"nirs@uncc.edu");

insert into persons values( 6, "xyz",986574892,"xyz@uncc.edu");
insert into persons values( 8, "Anil",879678968,"anil@uncc.edu");

insert into persons values( 9, "Rupa",956253256,"rupa@uncc.edu");

insert into persons values( 10, "Gaurav",986574892,"gaurav@uncc.edu");



insert into students values( 1, "230 barton creek","CS","CSS",2018);

insert into students values( 2, "212 barton creek","MS","BAS",2019);

insert into students values( 3, "956 University drive","BA","DBSA",2020);


insert into faculty values(4,"Full");

insert into faculty values(5,"Temp");

insert into faculty values(6,"Full");
drop table supervisors;
create table Supervisors(person_id int(10),
supervisor_type varchar(20),
foreign key(person_id) references persons(person_id)
);

insert into Supervisors values(8,"Managing");


insert into Supervisors values(9,"Directing");

insert into Supervisors values(10,"Managing");


/*drop table placements;*/



create table placements (
student_id int(10) ,
supervisor_id int(10) ,
internship_id varchar(10),
note varchar(50),evaluation_id VARCHAR(10),student_performance VARCHAR(10),
foreign key (student_id) references students(person_id),
foreign key (supervisor_id) references supervisors(person_id),
primary key(student_id,supervisor_id,internship_id,evaluation_id));

insert into placements values (1,8,"I01","IBM","EV01","good");

insert into placements values (2,9,"I02","Virtusa","EV02","average");

insert into placements values (3,10,"I03","TCS","EV03","excellent");


/*drop table internships;*/



create table internships(
internship_id varchar(10),
description varchar(20),
location varchar(30),
company_id varchar(10),
primary key (internship_id),foreign key (company_id) references companies(company_id));



insert into internships values ("I01","Hello","Texas","C01"); 
insert into internships values ("I02","Hru","Cali","C02"); 
insert into internships values ("I03","great","Florida","C03"); 

/*drop table companies;*/



create table companies(
company_id varchar(10),
company_name varchar(20),
company_email varchar(20),
comapny_address varchar(30),
company_phone int(10),
primary key (company_id)
);


insert into companies values ("C01","Wipro","wip@wipro.com","gachibowli","987777777");
 
insert into companies values ("C02","TCS","tcs@tcsgroup.com","NC","984567487");
 
insert into companies values ("C03","Infosys","info@infosys.com","Charlotte","985674848"); 


/*drop table internshipskill;*/



create table Internshipskill(
internship_id varchar(10),
skill_id varchar(10),
foreign key (internship_id) references internships(internship_id),
foreign key (skill_id) references skill(skill_id));



insert into internshipskill values ("I01","S01");

insert into internshipskill values ("I02","S02");

insert into internshipskill values ("I03","S03");

insert into internshipskill values ("I01","S03");

insert into internshipskill values ("I02","S04");

insert into internshipskill values ("I03","S06");

insert into internshipskill values ("I01","S07");

insert into internshipskill values ("I02","S08");

insert into internshipskill values ("I03","S09");


/*
drop table skill;*/



Create table Skill(
skill_id varchar(10) primary key,
skill_desc varchar(20)
);


insert into skill values ( "S01", "Good programmer");

insert into skill values ( "S02", "designing");

insert into skill values ( "S03", "Analysis");

insert into skill values ( "S04", "Good programmer");

insert into skill values ( "S05", "designing");

insert into skill values ( "S06", "Analysis");

insert into skill values ( "S07", "Good programmer");

insert into skill values ( "S08", "designing");

insert into skill values ( "S09", "Analysis");


/*drop table Temp;*/




create table Temp(
internship_id varchar(10) primary key,
startdate date,
enddate date,
foreign key (internship_id) references Internships(internship_id)
);



insert into temp values ("I01",'2005-06-06','2019-07-07');



/*delete from temp where internship_id="I02";

*delete from temp where internship_id="I03";



*drop table Stipend;
*/


create table Stipend(
internship_id varchar(10) primary key,
stipend double,
foreign key (internship_id) references Internships(internship_id)
);



insert into Stipend values ("I02", 23456);

/*drop table hourlywage;*/


create table HourlyWage(
internship_id varchar(10) primary key,
Hourlypay double,
payable boolean,
foreign key (internship_id) references Internships(internship_id)
);



insert into hourlywage values ("I03",34,True);