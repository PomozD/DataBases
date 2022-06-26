--- 9 лаба
--- 1 задание
use univer;
drop table #ex1;
EXEC SP_HELPINDEX 'AUDITORIUM';
EXEC SP_HELPINDEX 'AUDITORIUM_TYPE';
EXEC SP_HELPINDEX 'FACULTY';
EXEC SP_HELPINDEX 'GROUPS';
EXEC SP_HELPINDEX 'PROFESSION';
EXEC SP_HELPINDEX 'PROGRESS';
EXEC SP_HELPINDEX 'PULPIT';
EXEC SP_HELPINDEX 'STUDENT';
EXEC SP_HELPINDEX 'SUBJECT_T';
EXEC SP_HELPINDEX 'TEACHER';

CREATE TABLE #EX1 (
ID int IDENTITY(1,1),
TFIELD varchar(100)
);
set nocount on;
declare @i int = 0;
while (@i < 1000)
begin
INSERT #EX1 values(@i + GETDATE());
set @i = @i + 1;
end;
select *
from #EX1
where ID BETWEEN 150 AND 250
ORDER BY ID;
checkpoint;
DBCC DROPCLEANBUFFERS;
CREATE clustered index ##EX1_CL on #EX1(ID asc);
select *
from #EX1
where ID BETWEEN 150 AND 250
ORDER BY ID;

--- 2 задание
drop table #ex2;
go
CREATE TABLE #EX2 (
ID int IDENTITY(1,1),
TFIELD varchar(100),
RAND_NUM int
);
set nocount on;
declare @i int = 0;
while (@i < 10000)
begin
INSERT #EX2 values(@i + GETDATE(), floor(300*RAND()));
set @i = @i + 1;
end;
select COUNT(*) [Row count]
from #EX2;
checkpoint;
DBCC DROPCLEANBUFFERS;
CREATE clustered index #EX2_CL on #EX2(ID asc, TFIELD);
select *
from #EX2
where RAND_NUM = 123
ORDER BY ID;

--- 3 задание
go
CREATE TABLE #EX3 (
ID int IDENTITY(1,1),
TFIELD varchar(100),
RAND_NUM int
);
set nocount on;
declare @i int = 0;
while (@i < 10000)
begin
INSERT #EX3 values(@i + GETDATE(), floor(300*RAND()));
set @i = @i + 1;
end;
select TFIELD from #EX3 where ID between 1 and 100;
checkpoint;
DBCC DROPCLEANBUFFERS;
CREATE INDEX #EX3_CL on #EX3(ID) INCLUDE (TFIELD);
select *
from #EX3
where RAND_NUM = 123
ORDER BY ID;

--- 4 задание
CREATE TABLE #EX4 (
ID int IDENTITY(1,1),
TFIELD varchar(100),
RAND_NUM int
);
set nocount on;
declare @i int = 0;
while (@i < 20000)
begin
INSERT #EX4 values(@i + GETDATE(), floor(30000*RAND()));
set @i = @i + 1;
end;
CREATE INDEX #EX_where ON #EX4(RAND_NUM)
where RAND_NUM >= 10000 AND RAND_NUM <= 20000;
select RAND_NUM from #EX4 where RAND_NUM BETWEEN 5000 AND 19999;
select RAND_NUM from #EX4 where RAND_NUM >= 10000 AND RAND_NUM <= 20000;
select RAND_NUM from #EX4 where RAND_NUM = 17000;

--- 5 задание
go
CREATE TABLE #EX5 (
  ID int IDENTITY(1,1),
    TFIELD varchar(100),
  RAND_NUM int
);

set nocount on;
declare @i int = 0;
while (@i < 20000)
  begin
    INSERT #EX5 values(@i + GETDATE(), floor(30000*RAND()));
    set @i = @i + 1;
  end;

select * from #EX5 where ID between 150 and 200 order by ID; 

select a.index_id, name, avg_fragmentation_in_percent
from sys.dm_db_index_physical_stats (DB_ID(N'#EX5'),
NULL, NULL, NULL, NULL) AS a
JOIN sys.indexes AS b
ON a.object_id = b.object_id AND a.index_id = b.index_id;

ALTER index #EXAMPLE_UNCL on #EX5 reorganize;
ALTER index #EXAMPLE_UNCL on #EX5 rebuild with (online = off);

--- 6 задание
go
CREATE TABLE #EX6 (
  ID int IDENTITY(1,1),
    TFIELD varchar(100),
  RAND_NUM int
);

set nocount on;
declare @i int = 0;
while (@i < 20000)
  begin
    INSERT #EX6 values(@i + GETDATE(), floor(30000*RAND()));
    set @i = @i + 1;
  end;

CREATE index #EX_TKEY on #EX6(RAND_NUM) with (fillfactor = 65);

INSERT top(50) percent into #EX6(TFIELD, RAND_NUM)
  select TFIELD, RAND_NUM  from #EX6;

select a.index_id, name, avg_fragmentation_in_percent
from sys.dm_db_index_physical_stats (DB_ID(N'#EX6'),
NULL, NULL, NULL, NULL) AS a
JOIN sys.indexes AS b
ON a.object_id = b.object_id AND a.index_id = b.index_id;

--- 10 лаба
--- 1 задание
use UNIVER;
declare SUBJECTS_ISIT 
cursor for
select SUBJECT_T.SUBJECT_T
from SUBJECT_T
where SUBJECT_T.PULPIT = 'ИСиТ';
declare @subject char(30), @subjects char(500) ='';
open SUBJECTS_ISIT;
fetch SUBJECTS_ISIT into @subject;
print 'Дисциплины на кафедре ИСиТ:';
while @@fetch_STATUS = 0
begin
set @subjects = RTRIM(@subject) + ', ' + @subjects;
fetch SUBJECTS_ISIT into @subject;
end;
print @subjects;
close SUBJECTS_ISIT;

--- 2 задание
-- Локальный курсор
use univer;
declare SUBJECTS_ISIT_local
cursor local for
select SUBJECT_T.SUBJECT_T
from SUBJECT_T
where SUBJECT_T.PULPIT = 'ИСиТ';
print 'Дисциплины кафедры ИСиТ:';
print 'Локальный курсор';
go
declare @subject char(30), @subjects char(500) ='';
open SUBJECTS_ISIT_local;
fetch SUBJECTS_ISIT_local into @subject;
while @@fetch_STATUS = 0
begin
set @subjects = RTRIM(@subject) +', ' + @subjects;
fetch SUBJECTS_ISIT_local into @subject;
end;
print @subjects;
close SUBJECTS_ISIT_local;
go




DECLARE SUBJECTS_ISIT_local CURSOR LOCAL                            
for SELECT SUBJECT_T.SUBJECT_T from SUBJECT_T
where SUBJECT_T.PULPIT = 'ИСиТ'
print 'Дисциплины кафедры ИСиТ:';
print 'Локальный курсор';
go
declare @subject char(30), @subjects char(500) ='';      
	OPEN SUBJECTS_ISIT_local;	  
	fetch  SUBJECTS_ISIT_local into @subject; 	
      print '1. '+@subject;   
      go
 DECLARE @subject char(30), @subjects char(500) ='';     	
	fetch  SUBJECTS_ISIT_local into @subject;	
      print '2. '+@subject;  
  go
  
  
  
  
  DECLARE SUBJECTS_ISIT_global CURSOR GLOBAL                            
for SELECT SUBJECT_T.SUBJECT_T from SUBJECT_T
where SUBJECT_T.PULPIT = 'ИСиТ'
print 'Дисциплины кафедры ИСиТ:';
print 'Глобальный курсор';
go
declare @subject char(30), @subjects char(500) ='';      
	OPEN SUBJECTS_ISIT_global;	  
	fetch  SUBJECTS_ISIT_global into @subject; 	
      print '1. '+@subject;   
      go
 DECLARE @subject char(30), @subjects char(500) ='';     	
	fetch  SUBJECTS_ISIT_global into @subject;	
      print '2. '+@subject;  
	  CLOSE SUBJECTS_ISIT_global;
	  deallocate SUBJECTS_ISIT_global;
  go  

-- Глобальный курсор
go
use UNIVER;
declare SUBJECTS_ISIT_global 
cursor global for
select SUBJECT_T.SUBJECT_T
from SUBJECT_T
where SUBJECT_T.PULPIT = 'ИСиТ';
print 'Дисциплины на кафедре ИСиТ:';
print 'Глобальный курсор';
go
declare @subject char(30), @subjects char(500) ='';
open SUBJECTS_ISIT_global;
fetch SUBJECTS_ISIT_global into @subject;
while @@fetch_STATUS = 0
begin
set @subjects = RTRIM(@subject) +', ' + @subjects;
fetch SUBJECTS_ISIT_global into @subject;
end;
print @subjects;
close SUBJECTS_ISIT_global;
go

--- 3 задание
-- Статический курсор
use univer;
declare SUBJECTS_ISIT_static 
cursor static for
select SUBJECT_T.SUBJECT_T
from SUBJECT_T
where SUBJECT_T.PULPIT = 'ИСиТ';
declare @subject char(30), @subjects char(500) ='';
open SUBJECTS_ISIT_static;
insert into SUBJECT_T values('test', 'test', 'ИСиТ');
fetch SUBJECTS_ISIT_static into @subject;
print 'Дисциплины на кафедре ИСиТ:';
print 'Статический курсор';
while @@fetch_STATUS = 0
begin
set @subjects = RTRIM(@subject) +', ' + @subjects;
fetch SUBJECTS_ISIT_static into @subject;
end;
print @subjects;
close SUBJECTS_ISIT_static;
delete SUBJECT_T where SUBJECT_NAME = 'test';
go

-- Динамический курсор
go
use UNIVER;
declare SUBJECTS_ISIT_dynamic cursor dynamic for
select SUBJECT_T.SUBJECT_T
from SUBJECT_T
where SUBJECT_T.PULPIT = 'ИСиТ';
declare @subject char(30), @subjects char(500) ='';
open SUBJECTS_ISIT_dynamic;
insert into SUBJECT_T values('test', 'test', 'ИСиТ');
fetch SUBJECTS_ISIT_dynamic into @subject;
print 'Дисциплины на кафедре ИСиТ:';
print 'Динамический курсор';
while @@fetch_STATUS = 0
begin
set @subjects = RTRIM(@subject) +', ' + @subjects;
fetch SUBJECTS_ISIT_dynamic into @subject;
end;
print @subjects;
close SUBJECTS_ISIT_dynamic;
delete SUBJECT_T where SUBJECT_T = 'test';
go

--- 4 задание
go
set nocount on;
use UNIVER;
declare SUBJECTS_ISIT_scroll cursor local dynamic SCROLL for
select
ROW_NUMBER() over (order by SUBJECT_T),
SUBJECT_T.SUBJECT_T
from SUBJECT_T
where SUBJECT_T.PULPIT = 'ИСиТ';
declare @subject char(30), @row int = 0;
open SUBJECTS_ISIT_scroll;
fetch SUBJECTS_ISIT_scroll into @row, @subject;
print 'Next line: [' + CAST(@row as varchar(4)) + '. ' + RTRIM(@subject) + ']';
fetch LAST from SUBJECTS_ISIT_scroll into @row, @subject;
print 'Last line: [' + CAST(@row as varchar(4)) + '. ' + RTRIM(@subject) + ']';
fetch RELATIVE -1 from SUBJECTS_ISIT_scroll into @row, @subject;
print 'Previous line: [' + CAST(@row as varchar(4)) + '. ' + RTRIM(@subject) + ']';
fetch ABSOLUTE 2 from SUBJECTS_ISIT_scroll into @row, @subject;
print 'Second line: [' + CAST(@row as varchar(4)) + '. ' + RTRIM(@subject) + ']';
fetch ABSOLUTE -2 from SUBJECTS_ISIT_scroll into @row, @subject;
print 'Second line from end: [' + CAST(@row as varchar(4)) + '. ' + RTRIM(@subject) + ']';

--- 5 задание
insert into SUBJECT_T values('test1', 'test1', 'ИСиТ');
insert into SUBJECT_T values('test2', 'test2', 'ИСиТ');
insert into SUBJECT_T values('test3', 'test3', 'ИСиТ');
declare SUBJECTS_ISIT_currentof
cursor local dynamic for
select *
from SUBJECT_T
where SUBJECT_T.PULPIT = 'ИСиТ' AND SUBJECT_T LIKE 'test%'
for update;
declare @subject varchar(30), @subject_name varchar(30), @pulpit varchar(30);
open SUBJECTS_ISIT_currentof;
fetch SUBJECTS_ISIT_currentof into @subject, @subject_name, @pulpit;
print @subject + ' ' + @subject_name + ' ' + @pulpit;
delete SUBJECT_T where current of SUBJECTS_ISIT_currentof;
fetch SUBJECTS_ISIT_currentof into @subject, @subject_name, @pulpit;
update SUBJECT_T set SUBJECT_T.SUBJECT_T += '(upd)' where current of SUBJECTS_ISIT_currentof;
print @subject + ' ' + @subject_name + ' ' + @pulpit;
close SUBJECTS_ISIT_currentof;
open SUBJECTS_ISIT_currentof;
while @@fetch_STATUS = 0
begin
print @subject + ' ' + @subject_name + ' ' + @pulpit;
fetch SUBJECTS_ISIT_currentof into @subject, @subject_name, @pulpit;
end;
close SUBJECTS_ISIT_currentof;

--- 6 задание
go
declare @id varchar(10), @name varchar(100), @subj varchar(50), @note varchar(2);
declare PROGRESS_delete_cursor 
cursor local dynamic for
select STUDENT.IDSTUDENT, STUDENT.NAME, PROGRESS.SUBJECT_T, PROGRESS.NOTE
from PROGRESS JOIN STUDENT on PROGRESS.IDSTUDENT = STUDENT.IDSTUDENT
for update;
open PROGRESS_delete_cursor
fetch PROGRESS_delete_cursor into @id, @name, @subj, @note;
IF(@note < 4)
begin
delete PROGRESS where current of PROGRESS_delete_cursor;
end;
print @id + ' - ' + @name + ' - '+ RTRIM(@subj) + ' - ' + @note ;
while @@fetch_STATUS = 0
begin
fetch PROGRESS_delete_cursor into @id, @name, @subj, @note;
print @id + ' - ' + @name + ' - '+ RTRIM(@subj) + ' - ' + @note ;
IF(@note < 4)
begin
delete PROGRESS where current of PROGRESS_delete_cursor;
end;
end;
close PROGRESS_delete_cursor;
open PROGRESS_delete_cursor;
fetch PROGRESS_delete_cursor into @id, @name, @subj, @note;
IF (@note <= 9)
update PROGRESS set NOTE += 1 where current of PROGRESS_delete_cursor;
while (@@fetch_STATUS = 0)
begin
fetch PROGRESS_delete_cursor into @id, @name, @subj, @note;
print @id + ' - ' + @name + ' - '+ RTRIM(@subj) + ' - ' + @note ;
IF (@note <= 9)
begin
update PROGRESS set NOTE += 1 where current of PROGRESS_delete_cursor;
end;
end;
close PROGRESS_delete_cursor;

--- 11 лаба
-- 1 задание
set nocount on
if exists (select * from SYS.OBJECTS where OBJECT_ID= object_id(N'DBO.MyTable'))
drop table MyTable;
DECLARE @rows int;
SET IMPLICIT_TRANSACTIONS ON;
CREATE table MyTable(
X int UNIQUE
);
INSERT INTO MyTable VALUES
(1),(2),(3),(4);
SET @rows = (SELECT COUNT(*) FROM MyTable);
print 'Количество строк в таблице MyTable: ' + cast(@rows as varchar(5));
if @rows < 5
commit;
else
rollback;
SET IMPLICIT_TRANSACTIONS OFF;
if exists (select * from SYS.OBJECTS where OBJECT_ID = object_id(N'DBO.MyTable'))
print 'таблица MyTable есть';
else
print 'таблицы MyTable нет';

-- 2 задание
use UNIVER;
BEGIN try
BEGIN tran
DELETE SUBJECT_T WHERE SUBJECT_T LIKE 'test_subj%';
INSERT INTO SUBJECT_T VALUES('test_subj5', 'test_subj5', 'ИСиТ');
UPDATE dbo.SUBJECT_T
SET SUBJECT_T.SUBJECT_NAME = SUBJECT_T.SUBJECT_NAME + '(upd)'
FROM dbo.SUBJECT_T
WHERE SUBJECT_T.SUBJECT_NAME LIKE 'test_subj%';
SELECT *
FROM dbo.SUBJECT_T;
RAISERROR('Test error', 1, 1);
commit tran;
END try
BEGIN catch
print 'Ошибка: ' + cast(error_number() as varchar(5))
print 'Line: ' + cast(error_line() as varchar(5))
print 'Message: ' + error_message();
if @@TRANCOUNT > 0
rollback tran;
END catch;

-- 3 задание
use UNIVER;
DECLARE @checkpoint varchar(10);
BEGIN try
BEGIN transaction
DELETE SUBJECT_T WHERE SUBJECT_T LIKE 'test_subj%';
SET @checkpoint = 'checkpoint1'; SAVE transaction @checkpoint;
INSERT INTO SUBJECT_T VALUES('test_subj5', 'test_subj5', 'ИСиТ');
SET @checkpoint = 'checkpoint2'; SAVE transaction @checkpoint;
UPDATE dbo.SUBJECT_T
SET SUBJECT_T.SUBJECT_NAME = SUBJECT_T.SUBJECT_NAME + '(upd)'
FROM dbo.SUBJECT_T
WHERE SUBJECT_T.SUBJECT_NAME LIKE 'test_subj%';
SET @checkpoint = 'checkpoint3'; SAVE transaction @checkpoint;
SELECT *
FROM dbo.SUBJECT_T;
commit transaction;
END try
BEGIN catch
print 'Ошибка: ' + cast(error_number() as varchar(5))
print 'Line: ' + cast(error_line() as varchar(5))
print 'Message: ' + error_message();
if @@TRANCOUNT > 0
BEGIN
print 'Контрольная точка: ' + @checkpoint;
rollback transaction @checkpoint;
commit transaction;
END;
END catch;

-- 4 задание
--- A ---
SET transaction isolation level READ UNCOMMITTED;
BEGIN transaction
SELECT @@SPID 'SPID', 'insert SUBJECT' 'результат', *
FROM dbo.SUBJECT_T
WHERE SUBJECT_T.PULPIT = 'ИСиТ';
--- t1 ---
SELECT
@@SPID 'SPID',
'update AUDITORIUM' 'результат',
AUDITORIUM_NAME,
AUDITORIUM_TYPE,
AUDITORIUM_CAPACITY
FROM dbo.AUDITORIUM
WHERE AUDITORIUM.AUDITORIUM_TYPE LIKE 'ЛК%';
commit;
--- t2 ---
--- B ---
set transaction isolation level READ COMMITTED
begin transaction
SELECT @@SPID 'SPID';
INSERT into dbo.SUBJECT_T values('test_subj6', 'test_subj_tran', 'ИСиТ');
UPDATE AUDITORIUM SET AUDITORIUM.AUDITORIUM_CAPACITY = 22
FROM dbo.AUDITORIUM
WHERE AUDITORIUM.AUDITORIUM = '301-1';
--- t1 ---
--- t2 ---
rollback;

-- 5 задание
--- A ---
set transaction isolation level READ COMMITTED
begin transaction
select count(*) [count] from AUDITORIUM where AUDITORIUM_CAPACITY >= 30;
--- t1 ---
--- t2 ---
select
@@SPID 'SID',
'update AUDITORIUM' 'результат',
AUDITORIUM_NAME,
AUDITORIUM_TYPE,AUDITORIUM_CAPACITY
from AUDITORIUM
where AUDITORIUM_NAME = '301-1';
commit;
--- B ---
begin transaction
--- t1 ---
update AUDITORIUM set AUDITORIUM_CAPACITY = 30 where AUDITORIUM_NAME = '301-1';
commit;
--- t2 ---

--- 6 задание
--- A ---
set transaction isolation level REPEATABLE READ
begin transaction
select SUBJECT_NAME from SUBJECT_T where SUBJECT_T = 'test_subj6';
--- t1 ---
--- t2 ---
select case
when SUBJECT_T = 'test_subj6' then 'insert SUBJECT' else '-'
end 'результат',
SUBJECT_NAME
FROM SUBJECT_T
WHERE PULPIT = 'ИСиТ';
commit;
--- B ---
begin transaction
--- t1 ---
INSERT into dbo.SUBJECT_T values('test_subj6', 'test_subj6', 'ИСиТ');
commit;
--- t2 ---

-- 7 задание
set transaction isolation level SERIALIZABLE;
--- A ---
BEGIN transaction
DELETE SUBJECT_T WHERE SUBJECT_T LIKE 'test_subj%';
INSERT INTO SUBJECT_T VALUES('test_subj7', 'test_subj7', 'ИСиТ');
UPDATE dbo.SUBJECT_T
SET SUBJECT_T.SUBJECT_NAME = SUBJECT_T.SUBJECT_NAME + '(upd)'
FROM dbo.SUBJECT_T
WHERE SUBJECT_T.SUBJECT_NAME LIKE 'test_subj%';
--- t1 ---
SELECT SUBJECT_T from SUBJECT_T where SUBJECT_T LIKE 'test_subj%';
--- t2 ---
commit;
--- B ---
BEGIN transaction
delete SUBJECT_T where SUBJECT_T LIKE 'test_subj%';
INSERT INTO SUBJECT_T VALUES('test_subj7', 'test_subj7', 'ИСиТ');
UPDATE dbo.SUBJECT_T
SET SUBJECT_T.SUBJECT_NAME = SUBJECT_T.SUBJECT_NAME + '(upd)'
FROM dbo.SUBJECT_T
WHERE SUBJECT_T.SUBJECT_NAME LIKE 'test_subj%';
SELECT SUBJECT_T from SUBJECT_T where SUBJECT_T LIKE 'test_subj%';
--- t1 ---
commit;
SELECT SUBJECT_T from SUBJECT_T where SUBJECT_T LIKE 'test_subj%';
--- t2 ---

--- 8 задание
use UNIVER;
SET nocount on;
BEGIN transaction
INSERT INTO SUBJECT_T VALUES('test_subj8', 'test_subj8', 'ИСиТ');
BEGIN transaction
UPDATE dbo.SUBJECT_T
SET SUBJECT_T.SUBJECT_NAME = SUBJECT_T.SUBJECT_NAME + '(upd)'
FROM dbo.SUBJECT_T
WHERE SUBJECT_T.SUBJECT_NAME LIKE 'test_subj%';
commit;
if @@TRANCOUNT > 0
rollback;
SELECT *
FROM SUBJECT_T
WHERE SUBJECT_T.SUBJECT_NAME LIKE 'test_subj%';

--- 13 лаба
---1 задание
GO
CREATE function COUNT_STUDENTS(@faculty varchar(20) = null, @prof varchar(20) = null) returns int AS
BEGIN
RETURN (
SELECT count(IDSTUDENT)
FROM GROUPS
JOIN FACULTY ON GROUPS.FACULTY = FACULTY.FACULTY
JOIN STUDENT ON STUDENT.IDGROUP = GROUPS.IDGROUP AND GROUPS.PROFESSION = @prof
WHERE GROUPS.FACULTY = @faculty
);
END
GO
DECLARE @facult varchar(10) = 'ИТ';
DECLARE @profession varchar(10) = '1-40 01 02';
PRINT 'Количество студентов факультета [' + @facult
+ '] с профессией номер ['+ @profession + ']: '
+ cast(dbo.COUNT_STUDENTS(@facult, @profession) as varchar(5));

--- 2 задание
GO
CREATE function FSUBJECTS(@pulpit varchar(20)) returns varchar(300) AS
BEGIN
DECLARE @subject varchar(10), @subjects varchar(300) = 'Дисциплины: ';
DECLARE subj_cursor CURSOR STATIC LOCAL FOR
SELECT SUBJECT_T.SUBJECT_T
FROM SUBJECT_T
WHERE SUBJECT_T.PULPIT = @pulpit;
OPEN subj_cursor;
fetch subj_cursor into @subject;
while @@fetch_status = 0
begin
set @subjects = @subjects + rtrim(@subject) + ', ';
FETCH subj_cursor into @subject;
end;
CLOSE subj_cursor;
RETURN @subjects;
END
GO
SELECT PULPIT.PULPIT, dbo.FSUBJECTS(PULPIT) [SUBJECTS] FROM PULPIT;

--- 3 задание
GO
CREATE function FFACPUL(@faculty varchar(20), @pulpit varchar(20)) returns table AS
RETURN
SELECT FACULTY.FACULTY,PULPIT.PULPIT
FROM FACULTY
LEFT OUTER JOIN PULPIT ON FACULTY.FACULTY = PULPIT.FACULTY
WHERE FACULTY.FACULTY = isnull(@faculty, FACULTY.FACULTY) AND
PULPIT.PULPIT = isnull(@pulpit, PULPIT.PULPIT);
GO
select * from dbo.FFACPUL(NULL,NULL);
select * from dbo.FFACPUL('ТТЛП',NULL);
select * from dbo.FFACPUL(NULL,'ИСиТ');
select * from dbo.FFACPUL('ТТЛП','ТДП');
select * from dbo.FFACPUL('ЛХ','ПИ');

--- 4 задание
GO
CREATE function FTEACHER (@pulpit varchar(20)) returns int AS
BEGIN
DECLARE @result int = 0;
SET @result = (
SELECT count(*)
FROM TEACHER
JOIN PULPIT ON TEACHER.PULPIT = PULPIT.PULPIT
WHERE PULPIT.PULPIT = isnull(@pulpit, PULPIT.PULPIT)
);
RETURN @result;
END;
GO
select PULPIT, dbo.FTEACHER(PULPIT.PULPIT) 'Количество преподавателей' from PULPIT;
select dbo.FTEACHER(NULL) 'Всего преподавателей';
--- 6 задание
go
CREATE function COUNT_PULPIT(@faculty varchar(20)) returns int AS
begin
return (
SELECT count(PULPIT)
FROM PULPIT
WHERE FACULTY = @faculty
);
end;
go
CREATE function COUNT_GROUP(@faculty varchar(20)) returns int AS
begin
return (
SELECT count(IDGROUP)
FROM GROUPS
WHERE FACULTY = @faculty
);
end;
go
CREATE function COUNT_PROFESSION(@faculty varchar(20)) returns int AS
begin
return (
SELECT count(PROFESSION)
FROM PROFESSION
WHERE FACULTY = @faculty
);
end;
go
CREATE function COUNT_STUD(@faculty varchar(20) = null, @prof varchar(20) = null) returns int AS
BEGIN
RETURN (
SELECT count(IDSTUDENT)
FROM GROUPS
JOIN FACULTY ON GROUPS.FACULTY = FACULTY.FACULTY
JOIN STUDENT ON STUDENT.IDGROUP = GROUPS.IDGROUP AND GROUPS.PROFESSION = ISNULL(@prof, GROUPS.PROFESSION)
WHERE GROUPS.FACULTY = @faculty
);
END
go
CREATE function FACULTY_REPORT(@c int) returns @fr table(
[Факультет] varchar(50), [Количество кафедр] int, [Количество групп] int,
[Количество студентов] int, [Количество специальностей] int
) AS
begin
declare cc CURSOR static for select FACULTY.FACULTY from FACULTY where dbo.COUNT_STUD(FACULTY, NULL) > @c;
declare @f varchar(30);
open cc;
fetch cc into @f;
while @@fetch_status = 0
begin
insert @fr values(@f, dbo.COUNT_PULPIT(@f),
dbo.COUNT_GROUP(@f), dbo.COUNT_STUD(@f, NULL),
dbo.COUNT_PROFESSION(@f));
fetch cc into @f;
end;
return;
end;
go
SELECT * from dbo.FACULTY_REPORT(0);

--- 14 лаба
--- 1 задание
CREATE TABLE TR_AUDIT

(
ID int identity,
STMT varchar(20) check (STMT in ('INS','DEL','UPD')),
TRNAME varchar(50),
CC varchar(300)
);
GO
CREATE TRIGGER TR_TEACHERS_INS on TEACHER after INSERT AS
insert into TR_AUDIT values (
'INS',
'TR_TEACHER_INS',
'Преподаватель:' + rtrim((SELECT TEACHER from INSERTED)) +
'. Имя:' + rtrim((SELECT TEACHER_NAME from INSERTED)) +
'. Пол:' + rtrim((SELECT GENDER from INSERTED)) +
'. Кафедра: ' + rtrim((SELECT PULPIT from INSERTED))
);
INSERT into TEACHER(TEACHER,TEACHER_NAME,GENDER,PULPIT)
VALUES ('test','test','м','ИСиТ');
SELECT * from TR_AUDIT; 
--- 2 задание
GO
CREATE TRIGGER TR_TEACHER_DEL on TEACHER after DELETE AS
insert into TR_AUDIT values (
'DEL',
'TR_TEACHER_DEL',
'Преподаватель:' + rtrim((SELECT TEACHER from DELETED)) +
'. Имя:' + rtrim((SELECT TEACHER_NAME from DELETED)) +
'. Пол:' + rtrim((SELECT GENDER from DELETED)) +
'. Кафедра: ' + rtrim((SELECT PULPIT from DELETED))
);
GO
DELETE FROM TEACHER where TEACHER = 'test';
SELECT * from TR_AUDIT;
--- 3 задание
GO
CREATE TRIGGER TR_TEACHER_UPD on TEACHER after UPDATE AS
insert into TR_AUDIT values (
'UPD',
'TR_TEACHER_UPD',
'Преподаватель:' + rtrim((SELECT TEACHER from INSERTED)) +
'. Имя:' + rtrim((SELECT TEACHER_NAME from INSERTED)) +
'. Пол:' + rtrim((SELECT GENDER from INSERTED)) +
'. Кафедра: ' + rtrim((SELECT PULPIT from INSERTED))
);
GO
UPDATE TEACHER SET PULPIT = 'ТЛ' where TEACHER = 'РЖК';
SELECT * from TR_AUDIT;

--- 4 задание
GO
CREATE TRIGGER TR_TEACHER on TEACHER after INSERT, DELETE, UPDATE AS
DECLARE @upd int = (select count(*) from inserted),
@del int = (select count(*) from deleted);
if @upd > 0 and @del = 0
BEGIN
insert into TR_AUDIT values (
'INS',
'TR_TEACHER',
'Преподаватель:' + rtrim((SELECT TEACHER from INSERTED)) +
'. Имя:' + rtrim((SELECT TEACHER_NAME from INSERTED)) +
'. Пол:' + rtrim((SELECT GENDER from INSERTED)) +
'. Кафедра: ' + rtrim((SELECT PULPIT from INSERTED))
);
END
else if @upd = 0 and @del > 0
BEGIN
insert into TR_AUDIT values (
'DEL',
'TR_TEACHER',
'Преподаватель:' + rtrim((SELECT TEACHER from DELETED)) +
'. Имя:' + rtrim((SELECT TEACHER_NAME from DELETED)) +
'. Пол:' + rtrim((SELECT GENDER from DELETED)) +
'. Кафедра: ' + rtrim((SELECT PULPIT from DELETED))
);
END
else if @upd > 0 and @del > 0
BEGIN
insert into TR_AUDIT values (
'UPD',
'TR_TEACHER',
'Преподаватель:' + rtrim((SELECT TEACHER from INSERTED)) +
'. Имя:' + rtrim((SELECT TEACHER_NAME from INSERTED)) +
'. Пол:' + rtrim((SELECT GENDER from INSERTED)) +
'. Кафедра: ' + rtrim((SELECT PULPIT from INSERTED))
);
END
return;
GO
INSERT into TEACHER(TEACHER,TEACHER_NAME,GENDER,PULPIT) VALUES
('test','test','м','ИСиТ');
DELETE FROM TEACHER where TEACHER = 'test';
UPDATE TEACHER SET PULPIT = 'ЛВ' where TEACHER = 'РЖК';
SELECT * from TR_AUDIT;

--- 6 задание
drop trigger TR_TEACHER_DEL2;
GO
CREATE TRIGGER TR_TEACHER_DEL1 on TEACHER after DELETE AS
insert into TR_AUDIT values (
'DEL',
'TR_TEACHER_DEL1',
'Преподаватель:' + rtrim((SELECT TEACHER from DELETED)) +
'. Имя:' + rtrim((SELECT TEACHER_NAME from DELETED)) +
'. Пол:' + rtrim((SELECT GENDER from DELETED)) +
'. Кафедра: ' + rtrim((SELECT PULPIT from DELETED))
);
GO
GO
CREATE TRIGGER TR_TEACHER_DEL2 on TEACHER after DELETE AS
insert into TR_AUDIT values (
'DEL',
'TR_TEACHER_DEL2',
'Преподаватель:' + rtrim((SELECT TEACHER from DELETED)) +
'. Имя:' + rtrim((SELECT TEACHER_NAME from DELETED)) +
'. Пол:' + rtrim((SELECT GENDER from DELETED)) +
'. Кафедра: ' + rtrim((SELECT PULPIT from DELETED))
);
GO
GO
CREATE TRIGGER TR_TEACHER_DEL3 on TEACHER after DELETE AS
insert into TR_AUDIT values (
'DEL',
'TR_TEACHER_DEL3',
'Преподаватель:' + rtrim((SELECT TEACHER from DELETED)) +
'. Имя:' + rtrim((SELECT TEACHER_NAME from DELETED)) +
'. Пол:' + rtrim((SELECT GENDER from DELETED)) +
'. Кафедра: ' + rtrim((SELECT PULPIT from DELETED))
);
GO
exec SP_SETTRIGGERORDER @triggername = 'TEACHER.TR_TEACHER_DEL3',
@order = 'First', @stmttype = 'DELETE';
exec SP_SETTRIGGERORDER @triggername = 'TEACHER.TR_TEACHER_DEL2',
@order = 'Last', @stmttype = 'DELETE';
select t.name, e.type_desc
from sys.triggers t
join sys.trigger_events e on t.object_id = e.object_id
where OBJECT_NAME(t.parent_id) = 'TEACHER' and e.type_desc = 'DELETE';
DELETE FROM TEACHER where TEACHER = 'test';
SELECT * from TR_AUDIT;

--- 8 задание
use UNIVER;
set nocount on;
GO
create trigger FACULTY_INSTEAD_OF on FACULTY instead of DELETE AS
PRINT 'Instead of delete';
return;
delete from FACULTY where FACULTY ='ИТ';

--- 9 задание
GO
create trigger DDL_UNIVER on database for DDL_DATABASE_LEVEL_EVENTS AS
declare @t varchar(50) = EVENTDATA().value('(/EVENT_INS-TANCE/EventType)[1]', 'varchar(50)');
declare @t1 varchar(50) = EVENTDATA().value('(/EVENT_INS-TANCE/ObjectName)[1]', 'varchar(50)');
declare @t2 varchar(50) = EVENTDATA().value('(/EVENT_INS-TANCE/ObjectType)[1]', 'varchar(50)');
print 'Тип события: '+@t;
print 'Имя объекта: '+@t1;
print 'Тип объекта: '+@t2;
raiserror( N'Операции с таблицами запрещены ', 16, 1);
rollback;
CREATE TABLE BUBUB (
ID int identity(1,1)
)

--- 15 лаба
--- 1 задание
use UNIVER;
set nocount on;
go
SELECT * from TEACHER
where PULPIT = 'ИСиТ'
FOR xml PATH('TEACHER'), root('Преподаватели_ИСиТ'), elements;

--- 2 задание
use UNIVER;
set nocount on;
go
SELECT
AUDITORIUM.AUDITORIUM_NAME,
AUDITORIUM.AUDITORIUM_TYPE,
AUDITORIUM.AUDITORIUM_CAPACITY
FROM AUDITORIUM_TYPE
JOIN AUDITORIUM ON AUDITORIUM_TYPE.AUDITORIUM_TYPE = AUDITORIUM.AUDITORIUM_TYPE
WHERE AUDITORIUM.AUDITORIUM_TYPE like 'ЛК%'
for xml AUTO, root('Лекционные_аудитории'), elements;

--- 3 задание
use UNIVER;
set nocount on;
go
declare @h int = 0,
@x varchar(2000) =
'<?xml version="1.0" encoding="windows-1251" ?>
<SUBJECTS>
<SUBJECT_T SUBJECT_T="new_subj1" SUBJECT_NAME="new_subj1" PULPIT="ИСиТ" />
<SUBJECT_T SUBJECT_T="new_subj2" SUBJECT_NAME="new_subj2" PULPIT="ИСиТ" />
<SUBJECT_T SUBJECT_T="new_subj3" SUBJECT_NAME="new_subj3" PULPIT="ИСиТ" />
</SUBJECTS>';
exec sp_xml_preparedocument @h output, @x;
insert SUBJECT_T select [SUBJECT_T], [SUBJECT_NAME], [PULPIT]
from openxml(@h, '/SUBJECTS/SUBJECT_T', 0)
with([SUBJECT_T] nvarchar(10), [SUBJECT_NAME] nvarchar(100), [PULPIT] nvarchar(20))
exec sp_xml_removedocument @h;

--- 4 задание
use UNIVER
INSERT INTO STUDENT(IDGROUP, NAME, BDAY, INFO) values
(2, 'test', '1970-01-01',
'<паспорт>
<серия>1</серия>
<номер>123456</номер>
<дата_выдачи>1980-01-01</дата_выдачи>
<адрес>Беларусь, г. Минск, Свердлова 13а</адрес>
</паспорт>');
select * from STUDENT where NAME = 'test';
update STUDENT set INFO =
'<паспорт>
<серия>2</серия>
<номер>654321</номер>
<дата_выдачи>1981-01-01</дата_выдачи>
<адрес>Беларусь, г. Минск, Свердлова 13а</адрес>
</паспорт>'
where STUDENT.INFO.value('(/паспорт/серия)[1]','int') = 1;
select * from STUDENT where NAME = 'test';
select NAME,
INFO.value('(/паспорт/дата_выдачи)[1]', 'date') [дата_выдачи],
INFO.value('(/паспорт/адрес)[1]', 'varchar(100)') [адрес],
INFO.query('/паспорт') [паспорт]
from STUDENT where NAME = 'test';

--- 5 задание
use UNIVER;
drop xml schema collection Student_info;
create xml schema collection Student_info as
N'<?xml version="1.0" encoding="utf-16" ?>
<xs:schema attributeFormDefault="unqualified"
elementFormDefault="qualified"
xmlns:xs="http://www.w3.org/2001/XMLSchema">
<xs:element name="студент">
<xs:complexType><xs:sequence>
<xs:element name="паспорт" maxOccurs="1" minOccurs="1">
<xs:complexType>
<xs:attribute name="серия" type="xs:string" use="required" />
<xs:attribute name="номер" type="xs:unsignedInt" use="required"/>
<xs:attribute name="дата" use="required" >
<xs:simpleType> <xs:restriction base ="xs:string">
<xs:pattern value="[0-9]{2}.[0-9]{2}.[0-9]{4}"/>
</xs:restriction> </xs:simpleType>
</xs:attribute> </xs:complexType>
</xs:element>
<xs:element maxOccurs="3" name="телефон" type="xs:unsignedInt"/>
<xs:element name="адрес"> <xs:complexType><xs:sequence>
<xs:element name="страна" type="xs:string" />
<xs:element name="город" type="xs:string" />
<xs:element name="улица" type="xs:string" />
<xs:element name="дом" type="xs:string" />
<xs:element name="квартира" type="xs:string" />
</xs:sequence></xs:complexType> </xs:element>
</xs:sequence></xs:complexType>
</xs:element>
</xs:schema>';
alter table STUDENT alter column INFO xml(Student_info);
drop XML SCHEMA COLLECTION Student_info;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          