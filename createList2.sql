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
('201215001','����','��',20,'CS'),
('201215002','����','Ů',19,'CS'),
('201215003','����','Ů',18,'MA'),
('201215005','����','��',21,'MA'),
('201215004','����','��',19,'IS');

insert into Course values
('2','��ѧ',NULL,2),
('6','���ݴ���',NULL,2),
('7','PASCAL����','6',4),
('4','����ϵͳ','6',3),
('5','���ݽṹ','7',4),
('1','���ݿ�','5',4),
('3','��Ϣϵͳ','1',4);

insert into SC values
('201215001','1',92),
('201215001','2',85),
('201215001','3',88),
('201215002','2',90),
('201215002','3',80);

select Sno,Sname from Students;
select * from Students;
select Sno,Sname from Students where Ssex = '��';
select * from Students where Ssex = '��';
select Sno from SC;
select distinct Sno from SC;
select count(Sno) from SC;
select Sno,Sname from Students where Sname Like '��%';
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
select Sdept from Students where Ssex = 'Ů' group by Sdept having count(Sno) >= 1;
select Sdept from Students where Sage >= 19 group by Sdept having count(Sno) >= 2;
select Sno from SC where Grade >= 88 group by Sno having count(Sno) >= 2;
select First.Cname,Second.Cname from Course First,Course Second where First.Cpno = Second.Cno;
select Sno from SC where Cno = 2;
select Students.Sno,Students.Sname,SC.Grade from SC,Students where SC.Cno = 2 And Students.Sno = SC.Sno;
select Students.Sno from Students,SC where SC.Cno = 2 And Students.Ssex = '��' And Students.Sno = SC.Sno;
select Students.Sname from Students,SC,Course where Students.Ssex = '��' And Course.Cname = '���ݿ�' And Course.Cno = SC.Cno And SC.Sno = Students.Sno;
select Second.Sno,Second.Sname from Students First,Students Second where First.Sname = '����' And First.Ssex = Second.Ssex And First.Sno != Second.Sno;
select Students.Sno,Students.Sname from Students,SC First,SC Second where First.Sno = '201215001' And Second.Cno = First.Cno And Students.Sno = Second.Sno And First.Sno != Second.Sno group by Second.Sno having count(Second.Sno) >= 1; 

select Sname from Students where Sno in(
	select Sno from SC,Course where Course.Cpno = '5' and SC.Cno = Course.Cno group by Sno having count(SC.Sno) >= 1
)
select Cname,Cno from Course where Cpno =(
	select Cno from Course where Cname = '���ݿ�'
)
select Sno,Grade from SC where Grade >(
	select Grade from SC,Students where Sname = '����' and Students.Sno = SC.Sno and SC.Cno = '2' 
)
select Students.Sno,Sname from Students,SC,Course where Cname = '���ݿ�' and Students.sno = SC.sno and SC.Cno = Course.Cno and Grade = (
	select Grade from SC,Course where Course.Cname = '���ݿ�' and SC.Cno = Course.Cno
)
select First.Sno from SC First,SC Second where First.Cno = '1' and Second.Cno = '3' and First.Sno = Second.Sno;

select Students.Sno,Sname from Students,SC,Course where Students.Sno = SC.Sno and SC.Cno = Course.Cno group by Students.Sno having count(Students.Sno) > 1




	
