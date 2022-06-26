use KR1
CREATE TABLE [GROUP]
	(   IDGR int primary key,
	    FACLT int,
		PROF int,
		YEARP int
           ) ;

CREATE TABLE STUD
	(   IDST int IDENTITY(1,1) primary key,
	    IDGROUP int foreign key references [GROUP](IDGR),
		NAME nvarchar(50) NOT NULL,
		BDAY date
           ) ;
CREATE TABLE SESSIA
	(   SUBJ nvarchar(50) primary key,
	    IDST int foreign key references STUD(IDST),
		PDATE date,
		NOTE int default '1' check (NOTE >=1 and NOTE <=10)
           ) ;

ALTER Table STUD ADD IDSUBJ nvarchar(50) foreign key references [SESSIA](SUBJ);


---
select [GROUP].PROF, SESSIA.SUBJ, STUD.NAME, [GROUP].IDGR, AVG(SESSIA.NOTE) as avg_note
from [GROUP] inner join STUD
on [GROUP].IDGR = STUD.IDGROUP
inner join SESSIA
on SESSIA.SUBJ = STUD.IDSUBJ
GROUP by [GROUP].PROF, SESSIA.SUBJ, STUD.NAME, [GROUP].IDGR;


select [GROUP].PROF, SESSIA.SUBJ, STUD.NAME, [GROUP].IDGR, AVG(SESSIA.NOTE) as avg_note
from [GROUP] inner join STUD
on [GROUP].IDGR = STUD.IDGROUP
inner join SESSIA
on SESSIA.SUBJ = STUD.IDSUBJ
GROUP by [GROUP].FACLT;

use pasha;
create table [GROUP]
( IDGR int primary key,
  FACLT int not null,
  PROF int,
  YEARP date
)
create table STUD
( IDST int primary key,
  IDGROUP int foreign key references [GROUP](IDGR),
  NAME nvarchar(50),
  BDAY date
)
create table PROGR
( ID_PROGR int primary key identity(1,1),
  SUBJ nvarchar(50),
  IDST int foreign key references [STUD](IDST),
  PDATE date,
  NOTE int
)
insert into [GROUP] (IDGR, FACLT, PROF, YEARP)
values (1, 1, 1, '2020-01-01'),
(2, 1, 2, '2020-02-02'),
(3, 2, 3, '2020-03-03'),
(4, 3, 4, '2020-04-04');

insert into [STUD] (IDST, IDGROUP, NAME, BDAY)
values (1, 1, 'NAME1', '2000-01-01'),
(2, 2, 'NAME2', '2000-02-02'),
(3, 3, 'NAME3', '2000-03-03'),
(4, 4, 'NAME4', '2000-04-04');

insert into [PROGR] (SUBJ, IDST, PDATE, NOTE)
values ('SUBJ1', 1, '2021-01-01', 4),
('SUBJ2', 2, '2021-01-01', 5),
('SUBJ3', 3, '2021-01-01', 6),
('SUBJ4', 4, '2021-01-01', 7);

select NAME, PROF, SUBJ, NOTE from PROGR
inner join STUD on PROGR.IDST = STUD.IDST
inner join [GROUP] on STUD.IDGROUP = [GROUP].IDGR
where NOTE between 4 and 6 and FACLT = '2';

select NAME, PROF, SUBJ, NOTE from PROGR
inner join STUD on PROGR.IDST = STUD.IDST
inner join [GROUP] on STUD.IDGROUP = [GROUP].IDGR
where NOTE between 4 and 6 and FACLT = '1'
UNION
select NAME, PROF, SUBJ, NOTE from PROGR
inner join STUD on PROGR.IDST = STUD.IDST
inner join [GROUP] on STUD.IDGROUP = [GROUP].IDGR
where NOTE between 4 and 6 and FACLT = '2'
UNION
select NAME, PROF, SUBJ, NOTE from PROGR
inner join STUD on PROGR.IDST = STUD.IDST
inner join [GROUP] on STUD.IDGROUP = [GROUP].IDGR
where NOTE between 4 and 6 and FACLT = '3'
UNION
select NAME, PROF, SUBJ, NOTE from PROGR
inner join STUD on PROGR.IDST = STUD.IDST
inner join [GROUP] on STUD.IDGROUP = [GROUP].IDGR
where NOTE between 4 and 6 and FACLT = '4';

use liza;

Create table AUD_TYPE
( Kod_AUD int primary key,
  Name_AUD nvarchar(50)
)

Create table AUD
( Kod_AUD int primary key,
  Tip_AUD nvarchar(50) default 'ËÊ' not null,
  Vmest_AUD int check(Vmest_AUD, between 50 and 100))
)