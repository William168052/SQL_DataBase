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
('B001','�������','��е��ҵ������','���Ą�','���ݽṹ���㷨',66.0),
('B002','�������','�ߵȽ���������','��ɺ','���ݿ�ϵͳ����',42.0),
('B003','������ѧ��','�������������','��С��','�������Ȼ',45.0),
('B004','������ѧ��','�������������','������','�й�����ɢ�ľ�ѡ',62.0),
('B005','������ѧ��','�ߵȽ���������','���޺�','����֮��',50.0)
insert into Readers values
('R001','����','A','��','130123'),
('R002','���','B','Ů','130123'),
('R003','����','C','��','130123'),
('R004','����','D','��','130123'),
('R005','�α�','E','Ů','130123')
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

