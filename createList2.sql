CREATE TABLE Students( 
	Sno char(10) NOT NULL PRIMARY KEY,
	Sname char(5) NOT NULL UNIQUE,
	Ssex char(2) ,
	Sage int,
	Sdept char(5)
	
);

CREATE TABLE Course( 
	Cno char(4) PRIMARY KEY,
	Cname char(10),
	Cpno char(4),
	Ccredit int,
	FOREIGN KEY(Cpno) REFERENCES Course(Cno)
);

CREATE TABLE SC( 
	Sno char(10) NOT NULL,
	Cno char(4) NOT NULL,
	Grade float,
	FOREIGN KEY(Sno) REFERENCES Students(Sno),
	FOREIGN KEY(Cno) REFERENCES Course(Cno)
);

insert into Students values 
('201215001','李勇','男',20,'CS'),
('201215002','刘晨','女',19,'CS'),
('201215003','王敏','女',18,'MA'),
('201215005','李明','男',21,'MA'),
('201215004','张立','男',19,'IS');

insert into Course values
('2','数学',NULL,2),
('6','数据处理',NULL,2),
('7','PASCAL语言','6',4),
('4','操作系统','6',3),
('5','数据结构','7',4),
('1','数据库','5',4),
('3','信息系统','1',4);

insert into SC values
('201215001','1',92),
('201215001','2',85),
('201215001','3',88),
('201215002','2',90),
('201215002','3',80);

select Sno,Sname from Students;
select * from Students;
select Sno,Sname from Students where Ssex = '男';
select * from Students where Ssex = '男';
select Sno from SC;
select distinct Sno from SC;
select count(Sno) from SC;
select Sno,Sname from Students where Sname Like '张%';
select Sno,Cno,Grade from SC where Grade between 80 and 90;
select Cname from Course where Ccredit = 3 or Ccredit = 4;
select Cno,Cname from Course where Cpno is NULL;
select Sno,Sname,Sage from Students where Sage > 19;
select Sno,Sname,Sage from Students where Sage > 19 order by Sage ASC;
select Sno,Sname,Sage from Students where Sage > 19 order by Sno DESC;


select MAX(Sage) from Students,SC where Students.Sno = SC.Sno And  SC.Cno = 2;
select Sdept,count(Sno) from Students group by Sdept;
select Ccredit,count(Cno) from Course group by Ccredit; 
select Sage,count(Sno) from Students group by Sage;
select Sdept from Students where Ssex = '女' group by Sdept having count(Sno) >= 1;
select Sdept from Students where Sage >= 19 group by Sdept having count(Sno) >= 2;
select Sno from SC where Grade >= 88 group by Sno having count(Sno) >= 2;
select First.Cname,Second.Cname from Course First,Course Second where First.Cpno = Second.Cno;
select Sno from SC where Cno = 2;
select Students.Sno,Students.Sname,SC.Grade from SC,Students where SC.Cno = 2 And Students.Sno = SC.Sno;
select Students.Sno from Students,SC where SC.Cno = 2 And Students.Ssex = '男' And Students.Sno = SC.Sno;
select Students.Sname from Students,SC,Course where Students.Ssex = '男' And Course.Cname = '数据库' And Course.Cno = SC.Cno And SC.Sno = Students.Sno;
select Second.Sno,Second.Sname from Students First,Students Second where First.Sname = '李勇' And First.Ssex = Second.Ssex And First.Sno != Second.Sno;
select Students.Sno,Students.Sname from Students,SC First,SC Second where First.Sno = '201215001' And Second.Cno = First.Cno And Students.Sno = Second.Sno And First.Sno != Second.Sno group by Second.Sno having count(Second.Sno) >= 1; 

select Sname from Students where Sno in(
	select Sno from SC,Course where Course.Cpno = '5' and SC.Cno = Course.Cno group by Sno having count(SC.Sno) >= 1
)
select Cname,Cno from Course where Cpno =(
	select Cno from Course where Cname = '数据库'
)
select Sno,Grade from SC where Grade >(
	select Grade from SC,Students where Sname = '李勇' and Students.Sno = SC.Sno and SC.Cno = '2' 
)
select Students.Sno,Sname from Students,SC,Course where Cname = '数据库' and Students.sno = SC.sno and SC.Cno = Course.Cno and Grade = (
	select Grade from SC,Course where Course.Cname = '数据库' and SC.Cno = Course.Cno
)
select First.Sno from SC First,SC Second where First.Cno = '1' and Second.Cno = '3' and First.Sno = Second.Sno;

select Students.Sno,Sname from Students,SC,Course where Students.Sno = SC.Sno and SC.Cno = Course.Cno group by Students.Sno having count(Students.Sno) > 1




	
