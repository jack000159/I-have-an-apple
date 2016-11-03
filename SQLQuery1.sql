select * from sales


use product
create table sales(
編號 varchar(10) not null,
品名 varchar(50) not null,
售價 varchar(10) not null,
銷售數量 int not null)

insert into sales(編號,品名 ,售價,銷售數量)

values ('1','iPhone7 128G','28500','901'),
       ('2','iPhone7 plus 128G ','32500','801'),
	   ('3','iPhone6 128G ','22000','300'),
	   ('4','iPhone6 plus 128G ','25500','213'),
	   ('5','iPhone6 64G','20000','714'),
	   ('6','iPhone6 plus 64G','23000','2100'),
	   ('7','iPhone6s 128G','26500','800'),
	   ('8','iPhone6s plus 128G','28500','577'),
	   ('9','iPhone6s plus 64G','27500','601'),
	   ('10','iPhone6s 64G','26000','777'),
	   ('11','Samsung Galaxy A5 2016','20000','69'),
	   ('12','Samsung Galaxy A7 2016','22000','10'),
	   ('13','Samsung Galaxy J2','16000','5'),
	   ('14','Samsung Galaxy J3','17500','18'),
	   ('15','Samsung Galaxy J5 2016','18500','29'),
	   ('16','Samsung Galaxy J7 2016','19500','38'),
	   ('17','Samsung Galaxy J7 Prime','21000','49'),
	   ('18','Samsung Galaxy Note 5 (32G)','20000','108'),
	   ('19','Samsung Galaxy S7 edge(32G)','24500','200'),
	   ('20','Samsung Galaxy S7(32G)','25000','301')

	   select * from sales