create table Books(
Bno char(10) primary key not null,
BCate char(20),
Bpub char(20),
Bauthor char(8),
Bname char(20),
Bprice float
)
create table Readers(
Rno char(10) primary key not null,
Rname char(8),
Runit char(10),
Rsex char(2),
Rnum char(11)
)
create table Borrow(
Bno char(10),
Rno char(10),
Rdate date,
Foreign key(Bno) references Books(Bno),
Foreign key(Rno) references Readers(Rno)
)

insert into Books values
('B001','计算机类','机械工业出版社','罗文劼','数据结构与算法',66.0),
('B002','计算机类','高等教育出版社','王珊','数据库系统概论',42.0),
('B003','生命科学类','人民教育出版社','雷小军','人与大自然',45.0),
('B004','语言文学类','人民教育出版社','于文艳','中国近代散文精选',62.0),
('B005','语言文学类','高等教育出版社','王艳红','语言之美',50.0)
insert into Readers values
('R001','张三','A','男','130123'),
('R002','李睿','B','女','130123'),
('R003','李磊','C','男','130123'),
('R004','赵雄','D','男','130123'),
('R005','何冰','E','女','130123')
insert into Borrow values
('B002','R001','2018-01-02'),
('B001','R001','2017-12-24'),
('B003','R005','2017-06-18'),
('B005','R002','2018-02-14'),
('B002','R004','2018-03-18'),
('B001','R002','2017-09-12'),
('B004','R003','2017-12-24'),
('B005','R005','2018-01-12'),
('B002','R001','2017-12-22'),
('B003','R004','2018-02-14'),
('B001','R003','2017-12-24')

select 

