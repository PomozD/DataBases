use UNIVER;  

------------�������� � ���������� ������� AUDITORIUM_TYPE 

create table AUDITORIUM_TYPE 
(    AUDITORIUM_TYPE  char(10) constraint AUDITORIUM_TYPE_PK  primary key,  
      AUDITORIUM_TYPENAME  varchar(30)       
 )
insert into AUDITORIUM_TYPE   (AUDITORIUM_TYPE,  AUDITORIUM_TYPENAME )        values ('��',            '����������');
insert into AUDITORIUM_TYPE   (AUDITORIUM_TYPE,  AUDITORIUM_TYPENAME )         values ('��-�',          '������������ �����');
insert into AUDITORIUM_TYPE   (AUDITORIUM_TYPE, AUDITORIUM_TYPENAME )         values ('��-�',          '���������� � ���. ����������');
insert into AUDITORIUM_TYPE   (AUDITORIUM_TYPE,  AUDITORIUM_TYPENAME )          values  ('��-X',          '���������� �����������');
insert into AUDITORIUM_TYPE   (AUDITORIUM_TYPE, AUDITORIUM_TYPENAME )        values  ('��-��',   '����. ������������ �����');
                      
-------------�������� � ���������� ������� AUDITORIUM  
  create table AUDITORIUM 
(   AUDITORIUM   char(20)  constraint AUDITORIUM_PK  primary key,              
    AUDITORIUM_TYPE     char(10) constraint  AUDITORIUM_AUDITORIUM_TYPE_FK foreign key         
                      references AUDITORIUM_TYPE(AUDITORIUM_TYPE), 
   AUDITORIUM_CAPACITY  integer constraint  AUDITORIUM_CAPACITY_CHECK default 1  check (AUDITORIUM_CAPACITY between 1 and 300),  -- ����������� 
   AUDITORIUM_NAME      varchar(50)                                     
)
insert into  AUDITORIUM   (AUDITORIUM, AUDITORIUM_NAME,  
 AUDITORIUM_TYPE, AUDITORIUM_CAPACITY)   
values  ('206-1', '206-1','��-�', 15);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, 
AUDITORIUM_TYPE, AUDITORIUM_CAPACITY) 
values  ('301-1',   '301-1', '��-�', 15);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, 
AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )   
values  ('236-1',   '236-1', '��',   60);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, 
AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )  
values  ('313-1',   '313-1', '��-�',   60);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, 
AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )  
values  ('324-1',   '324-1', '��-�',   50);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, 
AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )   
 values  ('413-1',   '413-1', '��-�', 15);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, 
AUDITORIUM_TYPE, AUDITORIUM_CAPACITY ) 
values  ('423-1',   '423-1', '��-�', 90);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, 
AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )     
values  ('408-2',   '408-2', '��',  90);

  ------�������� � ���������� ������� FACULTY
  create table FACULTY
  (    FACULTY      char(10)   constraint  FACULTY_PK primary key,
       FACULTY_NAME  varchar(50) default '???'
  );
insert into FACULTY   (FACULTY,   FACULTY_NAME )
            values  ('����',   '���������� ���������� � �������');
insert into FACULTY   (FACULTY,   FACULTY_NAME )
            values  ('���',     '����������������� ���������');
insert into FACULTY   (FACULTY,   FACULTY_NAME )
            values  ('���',     '���������-������������� ���������');
insert into FACULTY   (FACULTY,   FACULTY_NAME )
            values  ('����',    '���������� � ������� ������ ��������������');
insert into FACULTY   (FACULTY,   FACULTY_NAME )
            values  ('���',     '���������� ������������ �������');
insert into FACULTY   (FACULTY,   FACULTY_NAME )
            values  ('��',     '��������� �������������� ����������');  
------�������� � ���������� ������� PROFESSION
   create table PROFESSION
  (   PROFESSION   char(20) constraint PROFESSION_PK  primary key,
       FACULTY    char(10) constraint PROFESSION_FACULTY_FK foreign key 
                            references FACULTY(FACULTY),
       PROFESSION_NAME varchar(100),    QUALIFICATION   varchar(50)  
  );  
 insert into PROFESSION(FACULTY, PROFESSION, PROFESSION_NAME, QUALIFICATION)    values    ('��',  '1-40 01 02',   '�������������� ������� � ����������', '�������-�����������-�������������' );
 insert into PROFESSION(FACULTY, PROFESSION, PROFESSION_NAME, QUALIFICATION)    values    ('��',  '1-47 01 01', '������������ ����', '��������-��������' );
 insert into PROFESSION(FACULTY, PROFESSION,  PROFESSION_NAME, QUALIFICATION)    values    ('��',  '1-36 06 01',  '��������������� ������������ � ������� ��������� ����������', '�������-��������������' );                     
 insert into PROFESSION(FACULTY, PROFESSION,  PROFESSION_NAME, QUALIFICATION)  values    ('����',  '1-36 01 08',    '��������������� � ������������ ������� �� �������������� ����������', '�������-�������' );
 insert into PROFESSION(FACULTY, PROFESSION,  PROFESSION_NAME, QUALIFICATION)      values    ('����',  '1-36 07 01',  '������ � �������� ���������� ����������� � ����������� ������������ ����������', '�������-�������' );
 insert into PROFESSION(FACULTY, PROFESSION, PROFESSION_NAME, QUALIFICATION)  values    ('���',  '1-75 01 01',      '������ ���������', '������� ������� ���������' );
 insert into PROFESSION(FACULTY, PROFESSION,  PROFESSION_NAME, QUALIFICATION)   values    ('���',  '1-75 02 01',   '������-�������� �������������', '������� ������-��������� �������������' );
 insert into PROFESSION(FACULTY, PROFESSION,     PROFESSION_NAME, QUALIFICATION)   values    ('���',  '1-89 02 02',     '������ � ������������������', '���������� � ����� �������' );
 insert into PROFESSION(FACULTY, PROFESSION, PROFESSION_NAME, QUALIFICATION)  values    ('���',  '1-25 01 07',  '��������� � ���������� �� �����������', '���������-��������' );
 insert into PROFESSION(FACULTY, PROFESSION,  PROFESSION_NAME, QUALIFICATION)      values    ('���',  '1-25 01 08',    '������������� ����, ������ � �����', '���������' );                      
 insert into PROFESSION(FACULTY, PROFESSION,     PROFESSION_NAME, QUALIFICATION)  values    ('����',  '1-36 05 01',   '������ � ������������ ������� ���������', '�������-�������' );
 insert into PROFESSION(FACULTY, PROFESSION,   PROFESSION_NAME, QUALIFICATION)   values    ('����',  '1-46 01 01',      '�������������� ����', '�������-��������' );
 insert into PROFESSION(FACULTY, PROFESSION,     PROFESSION_NAME, QUALIFICATION)      values    ('���',  '1-48 01 02',  '���������� ���������� ������������ �������, ���������� � �������', '�������-�����-��������' );                
 insert into PROFESSION(FACULTY, PROFESSION,   PROFESSION_NAME, QUALIFICATION)    values    ('���',  '1-48 01 05',    '���������� ���������� ����������� ���������', '�������-�����-��������' ); 
 insert into PROFESSION(FACULTY, PROFESSION,    PROFESSION_NAME, QUALIFICATION)  values    ('���',  '1-54 01 03',   '������-���������� ������ � ������� �������� �������� ���������', '������� �� ������������' ); 

------�������� � ���������� ������� PULPIT
  create table  PULPIT 
(   PULPIT   char(20)  constraint PULPIT_PK  primary key,
    PULPIT_NAME  varchar(100), 
    FACULTY   char(10)   constraint PULPIT_FACULTY_FK foreign key 
                         references FACULTY(FACULTY) 
);  
insert into PULPIT   (PULPIT, PULPIT_NAME, FACULTY )
  values  ('����', '�������������� ������ � ���������� ','��'  );
insert into PULPIT   (PULPIT, PULPIT_NAME, FACULTY)
    values  ('��', '�����������','���')      ;    
insert into PULPIT   (PULPIT, PULPIT_NAME, FACULTY)
   values  ('��', '��������������','���')  ;         
insert into PULPIT   (PULPIT, PULPIT_NAME, FACULTY)
  values  ('�����', '���������� � ����������������','���')   ;             
insert into PULPIT   (PULPIT,  PULPIT_NAME, FACULTY)
   values  ('����', '������ ������� � ������������','���') ;
insert into PULPIT   (PULPIT,  PULPIT_NAME, FACULTY)
   values  ('���', '������� � ������������������','���')         ;     
insert into PULPIT   (PULPIT, PULPIT_NAME, FACULTY)
   values  ('������','������������ �������������� � ������-��������� �������������','���')   ;       
insert into PULPIT   (PULPIT, PULPIT_NAME, FACULTY)
   values  ('��', '���������� ����', '����')    ;                      
insert into PULPIT   (PULPIT, PULPIT_NAME, FACULTY)
   values  ('�����','������ ����� � ���������� �������������','����')  ;
insert into PULPIT   (PULPIT, PULPIT_NAME, FACULTY)
   values  ('���','���������� �������������������� �����������', '����')  ; 
insert into PULPIT   (PULPIT, PULPIT_NAME, FACULTY)
values  ('�����','���������� � ������� ������� �� ���������','����')   ; 
insert into PULPIT   (PULPIT, PULPIT_NAME, FACULTY)
values  ('��', '������������ �����','���') ;
insert into PULPIT   (PULPIT, PULPIT_NAME, FACULTY)
 values  ('���','���������� ����������� ���������','���');             
insert into PULPIT   (PULPIT, PULPIT_NAME, FACULTY)
 values  ('�������','���������� �������������� ������� � ����� ���������� ���������� ','����') ;
insert into PULPIT   (PULPIT, PULPIT_NAME, FACULTY)
    values  ('�����','��������� � ��������� ���������� �����������','����')    ;                                           
insert into PULPIT   (PULPIT,    PULPIT_NAME, FACULTY)
values  ('����',    '������������� ������ � ����������','���') ;  
insert into PULPIT   (PULPIT,    PULPIT_NAME, FACULTY)
  values  ('����',   '����������� � ��������� ������������������','���')   ;
insert into PULPIT   (PULPIT,    PULPIT_NAME, FACULTY)
   values  ('������', '����������, �������������� �����, ������� � ������', '���') ;    
             
------�������� � ���������� ������� TEACHER
 create table TEACHER
 (   TEACHER    char(10)  constraint TEACHER_PK  primary key,
     TEACHER_NAME  varchar(100), 
     GENDER     char(1) CHECK (GENDER in ('�', '�')),
     PULPIT   char(20) constraint TEACHER_PULPIT_FK foreign key 
                         references PULPIT(PULPIT) 
 );
insert into  TEACHER    (TEACHER,   TEACHER_NAME, GENDER, PULPIT )
                       values  ('����',    '������ �������� �������������', '�',  '����');
insert into  TEACHER    (TEACHER,  TEACHER_NAME, GENDER, PULPIT )
                       values  ('�����',    '�������� ��������� ��������', '�', '����');
insert into  TEACHER    (TEACHER,  TEACHER_NAME, GENDER, PULPIT )
                       values  ('�����',    '���������� ������� ����������', '�', '����');
insert into  TEACHER    (TEACHER,  TEACHER_NAME, GENDER, PULPIT )
                       values  ('�����',    '�������� ������ ��������', '�', '����');
insert into  TEACHER    (TEACHER,  TEACHER_NAME, GENDER, PULPIT )
                       values  ('���',     '����� ��������� ����������', '�', '����');
insert into  TEACHER    (TEACHER,  TEACHER_NAME, GENDER, PULPIT )
                       values  ('���',     '��������� ����� ��������', '�', '����');
insert into  TEACHER    (TEACHER,  TEACHER_NAME, GENDER, PULPIT )
                      values  ('���',     '����� ������� ��������', '�', '����');
insert into  TEACHER    (TEACHER,  TEACHER_NAME, GENDER, PULPIT )
                       values  ('���',     '����� ������� �������������',  '�', '����');                     
insert into  TEACHER    (TEACHER,  TEACHER_NAME, GENDER, PULPIT )
                       values  ('���',     '����� ����� �������������',  '�',   '����');                                                                                           
insert into  TEACHER    (TEACHER,  TEACHER_NAME, GENDER, PULPIT )
             values  ('������',   '���������� ��������� �������������', '�','�����');
insert into  TEACHER    (TEACHER,  TEACHER_NAME, GENDER, PULPIT )
                       values  ('���',     '��������� ������� �����������', '�', '�����');                       
insert into  TEACHER    (TEACHER,  TEACHER_NAME,GENDER, PULPIT )
                       values  ('������',   '����������� ��������� ��������', '�', '����');
insert into  TEACHER    (TEACHER,  TEACHER_NAME, GENDER, PULPIT )
                       values  ('����',   '������� ��������� ����������', '�', '����');
insert into  TEACHER    (TEACHER,  TEACHER_NAME, GENDER, PULPIT )
                       values  ('����',   '������ ������ ��������', '�', '��');
insert into  TEACHER    (TEACHER,  TEACHER_NAME, GENDER, PULPIT )
                       values  ('����', '������� ������ ����������',  '�',  '������');
insert into  TEACHER    (TEACHER,  TEACHER_NAME, GENDER, PULPIT )
                       values  ('���',     '���������� ������� ��������', '�', '������');
insert into  TEACHER    (TEACHER,  TEACHER_NAME, GENDER, PULPIT )
                       values  ('���',   '������ ������ ���������� ', '�', '��');                      
insert into  TEACHER    (TEACHER,  TEACHER_NAME, GENDER, PULPIT )
                       values  ('�����',   '��������� �������� ���������', '�', '�����'); 
insert into  TEACHER    (TEACHER,  TEACHER_NAME, GENDER, PULPIT )
                       values  ('������',   '���������� �������� ����������', '�', '��'); 
insert into  TEACHER    (TEACHER,  TEACHER_NAME, GENDER, PULPIT )
                       values  ('�����',   '�������� ������ ����������', '�', '��'); 

------�������� � ���������� ������� SUBJECT_T
create table SUBJECT_T
    (     SUBJECT_T  char(10) constraint SUBJECT_PK  primary key, 
           SUBJECT_NAME varchar(100) unique,
           PULPIT  char(20) constraint SUBJECT_PULPIT_FK foreign key 
                         references PULPIT(PULPIT)   
     )
 insert into SUBJECT_T   (SUBJECT_T,   SUBJECT_NAME, PULPIT )
                       values ('����',   '������� ���������� ������ ������', '����');
insert into SUBJECT_T   (SUBJECT_T,   SUBJECT_NAME,  PULPIT)
                       values ('��',     '���� ������','����');
insert into SUBJECT_T   (SUBJECT_T,   SUBJECT_NAME,  PULPIT )
                       values ('���',    '�������������� ����������','����');
insert into SUBJECT_T   (SUBJECT_T,   SUBJECT_NAME,  PULPIT )
                       values ('����',  '������ �������������� � ����������������', '����');
insert into SUBJECT_T   (SUBJECT_T,   SUBJECT_NAME,  PULPIT )
                       values ('��',     '������������� ������ � ������������ ��������', '����');
insert into SUBJECT_T   (SUBJECT_T,   SUBJECT_NAME,  PULPIT )
                       values ('���',    '���������������� ������� ����������', '����');
insert into SUBJECT_T   (SUBJECT_T,   SUBJECT_NAME,  PULPIT )
                       values ('����',  '������������� ������ ��������� ����������', '����');
insert into SUBJECT_T   (SUBJECT_T,   SUBJECT_NAME,  PULPIT )
                       values ('���',     '�������������� �������������� ������', '����');
insert into SUBJECT_T   (SUBJECT_T,   SUBJECT_NAME,  PULPIT )
                       values ('��',      '������������ ��������� ','����');
insert into SUBJECT_T   (SUBJECT_T,   SUBJECT_NAME,  PULPIT )
           values ('�����',   '��������. ������, �������� � �������� �����', '�����');
insert into SUBJECT_T   (SUBJECT_T,   SUBJECT_NAME,  PULPIT )
                       values ('���',     '������������ �������������� �������', '����');
insert into SUBJECT_T   (SUBJECT_T,   SUBJECT_NAME, PULPIT )
                       values ('���',     '����������� ��������. ������������', '�����');
insert into SUBJECT_T   (SUBJECT_T,   SUBJECT_NAME, PULPIT)
                       values ('��',   '���������� ����������', '����');
insert into SUBJECT_T   (SUBJECT_T,   SUBJECT_NAME,PULPIT )
                      values ('��',   '�������������� ����������������','����');  
insert into SUBJECT_T   (SUBJECT_T,   SUBJECT_NAME, PULPIT )
               values ('����', '���������� ������ ���',  '����');                   
insert into SUBJECT_T   (SUBJECT_T,   SUBJECT_NAME,PULPIT )
               values ('���',  '��������-��������������� ����������������', '����');
insert into SUBJECT_T   (SUBJECT_T,   SUBJECT_NAME, PULPIT )
                       values ('��', '��������� ������������������','����');
insert into SUBJECT_T   (SUBJECT_T,   SUBJECT_NAME, PULPIT )
                       values ('��', '������������� ������','����');
insert into SUBJECT_T   (SUBJECT_T,   SUBJECT_NAME, PULPIT )
                       values ('������OO','�������� ������ ������ � ���� � ���. ������.','��');
insert into SUBJECT_T   (SUBJECT_T,   SUBJECT_NAME, PULPIT )
                       values ('�������','������ ������-��������� � ������������� ���������',  '������');
insert into SUBJECT_T   (SUBJECT_T,   SUBJECT_NAME,PULPIT )
                       values ('��', '���������� �������� ','��');
insert into SUBJECT_T   (SUBJECT_T,   SUBJECT_NAME,PULPIT )
                       values ('��',    '�����������', '�����') ;
insert into SUBJECT_T   (SUBJECT_T,   SUBJECT_NAME, PULPIT )
                       values ('��',    '������������ �����', '��')   ;
insert into SUBJECT_T   (SUBJECT_T,   SUBJECT_NAME,PULPIT )
                       values ('���',    '���������� ��������� �������','�������') ;
insert into SUBJECT_T   (SUBJECT_T,   SUBJECT_NAME, PULPIT )
                       values ('���',    '������ ��������� ����','��');
insert into SUBJECT_T   (SUBJECT_T,   SUBJECT_NAME,PULPIT )
                       values ('����',   '���������� � ������������ �������������', '�����') ;
insert into SUBJECT_T   (SUBJECT_T,   SUBJECT_NAME,PULPIT )
                       values ('����',   '���������� ���������� �������� ���������� ','�������');
insert into SUBJECT_T   (SUBJECT_T,   SUBJECT_NAME, PULPIT )
                       values ('���',    '���������� ������������','�������') ;                                                                                                                                                          
  
------�������� � ���������� ������� GROUPS
create table GROUPS 
(   IDGROUP  integer  identity(1,1) constraint GROUP_PK  primary key,              
    FACULTY   char(10) constraint  GROUPS_FACULTY_FK foreign key         
                                                         references FACULTY(FACULTY), 
     PROFESSION  char(20) constraint  GROUPS_PROFESSION_FK foreign key         
                                                         references PROFESSION(PROFESSION),
    YEAR_FIRST  smallint  check (YEAR_FIRST<=YEAR(GETDATE())),                  
  )
insert into GROUPS   (FACULTY,  PROFESSION, YEAR_FIRST )
         values ('����','1-40 01 02', 2013), --1
                ('����','1-40 01 02', 2012),
                ('����','1-40 01 02', 2011),
                ('����','1-40 01 02', 2010),
                ('����','1-47 01 01', 2013),---5 ��
                ('����','1-47 01 01', 2012),
                ('����','1-47 01 01', 2011),
                ('����','1-36 06 01', 2010),-----8 ��
                ('����','1-36 06 01', 2013),
                ('����','1-36 06 01', 2012),
                ('����','1-36 06 01', 2011),
                ('����','1-36 01 08', 2013),---12 ��                                                  
                ('����','1-36 01 08', 2012),
                ('����','1-36 07 01', 2011),
                ('����','1-36 07 01', 2010),
                ('���','1-48 01 02', 2012), ---16 �� 
                ('���','1-48 01 02', 2011),
                ('���','1-48 01 05', 2013),
                ('���','1-54 01 03', 2012),
                ('���','1-75 01 01', 2013),--20 ��      
                ('���','1-75 02 01', 2012),
                ('���','1-75 02 01', 2011),
                ('���','1-89 02 02', 2012),
                ('���','1-89 02 02', 2011),  
                ('����','1-36 05 01', 2013),
                ('����','1-36 05 01', 2012),
                ('����','1-46 01 01', 2012),--27 ��
                ('���','1-25 01 07', 2013), 
                ('���','1-25 01 07', 2012),     
                ('���','1-25 01 07', 2010),
                ('���','1-25 01 08', 2013),
                ('���','1-25 01 08', 2012); ---32 ��       
                          
------�������� � ���������� ������� STUDENT
create table STUDENT 
(    IDSTUDENT   integer  identity(1000,1) constraint STUDENT_PK  primary key,
      IDGROUP   integer  constraint STUDENT_GROUP_FK foreign key         
                      references GROUPS(IDGROUP),        
      NAME   nvarchar(100), 
      BDAY   date,
      STAMP  timestamp,
      INFO     xml,
      FOTO     varbinary
 ) 
insert into STUDENT (IDGROUP,NAME, BDAY)
    values (2, '����� ������� ��������',         '12.07.1994'),
           (2, '������� �������� ����������',    '06.03.1994'),
           (2, '�������� ����� �����������',     '09.11.1994'),
           (2, '������� ����� ���������',        '04.10.1994'),
           (2, '��������� ��������� ����������', '08.01.1994'),
           (3, '������� ������ ���������',       '02.08.1993'),
           (3, '������� ��� ����������',         '07.12.1993'),
           (3, '������� ����� �����������',      '02.12.1993'),
           (4, '������� ������ �����������',     '08.03.1992'),
           (4, '������� ����� �������������',    '02.06.1992'),
           (4, '�������� ����� �����������',     '11.12.1992'),
           (4, '�������� ������� �������������', '11.05.1992'),
           (4, '����������� ������� ��������',   '09.11.1992'),
           (4, '�������� ������� ����������',    '01.11.1992'),
           (5, '�������� ����� ������������',    '08.07.1995'),
           (5, '������ ������� ����������',      '02.11.1995'),
           (5, '������ ��������� �����������',   '07.05.1995'),
           (5, '����� ��������� ���������',      '04.08.1995'),
           (6, '���������� ����� ����������',    '08.11.1994'),
           (6, '�������� ������ ��������',       '02.03.1994'),
           (6, '���������� ����� ����������',    '04.06.1994'),
           (6, '��������� ���������� ���������', '09.11.1994'),
           (6, '����� ��������� �������',        '04.07.1994'),
           (7, '����������� ����� ������������', '03.01.1993'),
           (7, '������� ���� ��������',          '12.09.1993'),
           (7, '��������� ������ ��������',      '12.06.1993'),
           (7, '���������� ��������� ����������','09.02.1993'),
           (7, '������� ������ ���������',       '04.07.1993'),
           (8, '������ ������� ���������',       '08.01.1992'),
           (8, '��������� ����� ����������',     '12.05.1992'),
           (8, '�������� ����� ����������',      '08.11.1992'),
           (8, '������� ������� ���������',      '12.03.1992'),
           (9, '�������� ����� �������������',   '10.08.1995'),
           (9, '���������� ������ ��������',     '02.05.1995'),
           (9, '������ ������� �������������',   '08.01.1995'),
           (9, '��������� ��������� ��������',   '11.09.1995'),
           (10, '������ ������� ������������',   '08.01.1994'),
           (10, '������ ������ ����������',      '11.09.1994'),
           (10, '����� ���� �������������',      '06.04.1994'),
           (10, '������� ������ ����������',     '12.08.1994');
insert into STUDENT (IDGROUP,NAME, BDAY)
    values (11, '��������� ��������� ����������','07.11.1993'),
           (11, '������ ������� ����������',     '04.06.1993'),
           (11, '������� ����� ����������',      '10.12.1993'),
           (11, '������� ������ ����������',     '04.07.1993'),
           (11, '������� ����� ���������',       '08.01.1993'),
           (11, '����� ������� ����������',      '02.09.1993'),
           (12, '���� ������ �����������',       '11.12.1995'),
           (12, '������� ���� �������������',    '10.06.1995'),
           (12, '��������� ���� ���������',      '09.08.1995'),
           (12, '����� ����� ���������',         '04.07.1995'),
           (12, '��������� ������ ����������',   '08.03.1995'),
           (12, '����� ����� ��������',          '12.09.1995'),
           (13, '������ ����� ������������',     '08.10.1994'),
           (13, '���������� ����� ����������',   '10.02.1994'),
           (13, '�������� ������� �������������','11.11.1994'),
           (13, '���������� ����� ����������',   '10.02.1994'),
           (13, '����������� ����� ��������',    '12.01.1994'),
           (14, '�������� ������� �������������','11.09.1993'),
           (14, '������ �������� ����������',    '01.12.1993'),
           (14, '���� ������� ����������',       '09.06.1993'),
           (14, '�������� ���������� ����������','05.01.1993'),
           (14, '����������� ����� ����������',  '01.07.1993'),
           (15, '������� ��������� ���������',   '07.04.1992'),
           (15, '������ �������� ���������',     '10.12.1992'),
           (15, '��������� ����� ����������',    '05.05.1992'),
           (15, '���������� ����� ������������', '11.01.1992'),
           (15, '�������� ����� ����������',     '04.06.1992'),
           (16, '����� ����� ����������',        '08.01.1994'),
           (16, '��������� ��������� ���������', '07.02.1994'),
           (16, '������ ������ �����������',     '12.06.1994'),
           (16, '������� ����� ��������',        '03.07.1994'),
           (16, '������ ������ ���������',       '04.07.1994'),
           (17, '������� ��������� ����������',  '08.11.1993'),
           (17, '������ ����� ����������',       '02.04.1993'),
           (17, '������ ���� ��������',          '03.06.1993'),
           (17, '������� ������ ���������',      '05.11.1993'),
           (17, '������ ������ �������������',   '03.07.1993'),
           (18, '��������� ����� ��������',      '08.01.1995'),
           (18, '���������� ��������� ���������','06.09.1995'),
           (18, '�������� ��������� ����������', '08.03.1995'),
           (18, '��������� ����� ��������',      '07.08.1995');

------�������� � ���������� ������� PROGRESS
create table PROGRESS
 (  SUBJECT_T   char(10) constraint PROGRESS_SUBJECT_FK foreign key
                      references SUBJECT_T(SUBJECT_T),                
     IDSTUDENT integer  constraint PROGRESS_IDSTUDENT_FK foreign key         
                      references STUDENT(IDSTUDENT),        
     PDATE    date, 
     NOTE     integer check (NOTE between 1 and 10)
  )
insert into PROGRESS (SUBJECT_T, IDSTUDENT, PDATE, NOTE)
    values  ('����', 1001,  '01.10.2013',8),
           ('����', 1002,  '01.10.2013',7),
           ('����', 1003,  '01.10.2013',5),
           ('����', 1005,  '01.10.2013',4);
insert into PROGRESS (SUBJECT_T, IDSTUDENT, PDATE, NOTE)
    values   ('����', 1014,  '01.12.2013',5),
           ('����', 1015,  '01.12.2013',9),
           ('����', 1016,  '01.12.2013',5),
           ('����', 1017,  '01.12.2013',4);
insert into PROGRESS (SUBJECT_T, IDSTUDENT, PDATE, NOTE)
    values ('��',   1018,  '06.5.2013',4),
           ('��',   1019,  '06.05.2013',7),
           ('��',   1020,  '06.05.2013',7),
           ('��',   1021,  '06.05.2013',9),
           ('��',   1022,  '06.05.2013',5),
           ('��',   1023,  '06.05.2013',6);

--- 1 ������
select AUDITORIUM.AUDITORIUM, AUDITORIUM_TYPE.AUDITORIUM_TYPENAME
from AUDITORIUM inner join AUDITORIUM_TYPE
on AUDITORIUM.AUDITORIUM_TYPE = AUDITORIUM_TYPE.AUDITORIUM_TYPE;

--- 2 ������
select AUDITORIUM.AUDITORIUM, AUDITORIUM_TYPE.AUDITORIUM_TYPENAME
from AUDITORIUM inner join AUDITORIUM_TYPE
on AUDITORIUM.AUDITORIUM_TYPE = AUDITORIUM_TYPE.AUDITORIUM_TYPE
and AUDITORIUM_TYPENAME like '%����%';

---3 ������� 1 ������
select AUDITORIUM.AUDITORIUM, AUDITORIUM_TYPE.AUDITORIUM_TYPENAME
from AUDITORIUM, AUDITORIUM_TYPE
where AUDITORIUM.AUDITORIUM_TYPE = AUDITORIUM_TYPE.AUDITORIUM_TYPE;

---3 ������� 2 ������
select AUDITORIUM.AUDITORIUM, AUDITORIUM_TYPE.AUDITORIUM_TYPENAME
from AUDITORIUM, AUDITORIUM_TYPE
where AUDITORIUM.AUDITORIUM_TYPE = AUDITORIUM_TYPE.AUDITORIUM_TYPE
and AUDITORIUM_TYPENAME like '%����%';

---4 �������
select FACULTY.FACULTY as '���������', PULPIT.PULPIT as '�������', PROFESSION.PROFESSION_NAME as '�������������', SUBJECT_T.SUBJECT_NAME as '�������� ����������', STUDENT.NAME as '��� ��������',
case
	when(PROGRESS.NOTE = 6) then '�����'
	when(PROGRESS.NOTE = 7) then '����'
	when(PROGRESS.NOTE = 8) then '������'
END [������]
from STUDENT inner join PROGRESS on STUDENT.IDSTUDENT = PROGRESS.IDSTUDENT
inner join SUBJECT_T on PROGRESS.SUBJECT_T = SUBJECT_T.SUBJECT_T and (PROGRESS.NOTE between 6 and 8)
inner join GROUPS on STUDENT.IDGROUP = GROUPS.IDGROUP
inner join PULPIT on SUBJECT_T.PULPIT = PULPIT.PULPIT
inner join PROFESSION on PROFESSION.PROFESSION = GROUPS.PROFESSION
inner join FACULTY on GROUPS.FACULTY = FACULTY.FACULTY
order by FACULTY.FACULTY, PULPIT.PULPIT, PROFESSION.PROFESSION, STUDENT.NAME asc,
PROGRESS.NOTE desc;

---5 �������
select FACULTY.FACULTY as '���������', PULPIT.PULPIT as '�������', PROFESSION.PROFESSION_NAME as '�������������', SUBJECT_T.SUBJECT_NAME as '�������� ����������', STUDENT.NAME as '��� ��������',
case
	when(PROGRESS.NOTE = 6) then '�����'
	when(PROGRESS.NOTE = 7) then '����'
	when(PROGRESS.NOTE = 8) then '������'
END [������]
from STUDENT inner join PROGRESS on STUDENT.IDSTUDENT = PROGRESS.IDSTUDENT
inner join SUBJECT_T on PROGRESS.SUBJECT_T = SUBJECT_T.SUBJECT_T and (PROGRESS.NOTE between 6 and 8)
inner join GROUPS on STUDENT.IDGROUP = GROUPS.IDGROUP
inner join PULPIT on SUBJECT_T.PULPIT = PULPIT.PULPIT
inner join PROFESSION on PROFESSION.PROFESSION = GROUPS.PROFESSION
inner join FACULTY on GROUPS.FACULTY = FACULTY.FACULTY
order by FACULTY.FACULTY, PULPIT.PULPIT, PROFESSION.PROFESSION, STUDENT.NAME asc,
(case
	when(PROGRESS.NOTE = 7) then 1
	when(PROGRESS.NOTE = 8) then 2
	when(PROGRESS.NOTE = 6) then 3
end);

---6 �������
use UNIVER
SELECT PULPIT.PULPIT_NAME [�������], ISNULL(TEACHER.TEACHER_NAME, '***') [�������������]
FROM PULPIT LEFT OUTER JOIN TEACHER
ON TEACHER.PULPIT = PULPIT.PULPIT;

---7 �������
use UNIVER
SELECT PULPIT.PULPIT_NAME [�������], ISNULL(TEACHER.TEACHER_NAME, '***') [�������������]
FROM TEACHER LEFT OUTER JOIN PULPIT
ON TEACHER.PULPIT = PULPIT.PULPIT;

---8 �������
SELECT ISNULL(TEACHER.TEACHER_NAME, '***') [TEACHER], SUBJECT_T.SUBJECT_NAME [SUBJECT]
FROM TEACHER INNER JOIN PULPIT
ON TEACHER.PULPIT = PULPIT.PULPIT
FULL OUTER JOIN SUBJECT_T
ON PULPIT.PULPIT = SUBJECT_T.PULPIT
WHERE TEACHER.TEACHER_NAME IS NULL;

---
SELECT ISNULL(SUBJECT_T.SUBJECT_NAME, '***') [SUBJECT], TEACHER.TEACHER_NAME [TEACHER]
FROM PULPIT INNER JOIN TEACHER
ON TEACHER.PULPIT = PULPIT.PULPIT
FULL OUTER JOIN SUBJECT_T
ON PULPIT.PULPIT = SUBJECT_T.PULPIT
WHERE SUBJECT_T.SUBJECT_NAME IS NULL;

---
SELECT SUBJECT_T.SUBJECT_NAME [SUBJECT], TEACHER.TEACHER_NAME [TEACHER]
FROM PULPIT INNER JOIN TEACHER
ON TEACHER.PULPIT = PULPIT.PULPIT
FULL OUTER JOIN SUBJECT_T
ON PULPIT.PULPIT = SUBJECT_T.PULPIT
WHERE SUBJECT_T.SUBJECT_NAME IS NOT NULL
and TEACHER.TEACHER_NAME IS NOT NULL;

--- 9 �������
use UNIVER
SELECT AUDITORIUM.AUDITORIUM, AUDITORIUM_TYPE.AUDITORIUM_TYPENAME
FROM AUDITORIUM CROSS JOIN AUDITORIUM_TYPE
WHERE AUDITORIUM.AUDITORIUM_TYPE = AUDITORIUM_TYPE.AUDITORIUM_TYPE;



--- 6 ����
---1 �������
select PULPIT.PULPIT_NAME
from FACULTY, PULPIT
where FACULTY.FACULTY = PULPIT.FACULTY
and
	FACULTY.FACULTY in (select PROFESSION.FACULTY
			from PROFESSION
			where (
			PROFESSION.PROFESSION_NAME LIKE '%����������%' OR
			PROFESSION.PROFESSION_NAME LIKE '%����������%'
		));

---2 �������
select PULPIT.PULPIT_NAME
from FACULTY INNER JOIN PULPIT
on FACULTY.FACULTY = PULPIT.FACULTY and
FACULTY.FACULTY in (select PROFESSION.FACULTY
			from PROFESSION
			where (
			PROFESSION.PROFESSION_NAME LIKE '%����������%' OR
			PROFESSION.PROFESSION_NAME LIKE '%����������%'
		));
---3 �������
select distinct PULPIT.PULPIT_NAME
from FACULTY
inner join PULPIT on FACULTY.FACULTY = PULPIT.FACULTY
inner join PROFESSION on PROFESSION.FACULTY = FACULTY.FACULTY and
	(PROFESSION.PROFESSION_NAME like '%����������%' OR
			PROFESSION.PROFESSION_NAME like '%����������%');
---4 �������

select x.AUDITORIUM,
	x.AUDITORIUM_CAPACITY,
	x.AUDITORIUM_TYPE
from AUDITORIUM as x
where x.AUDITORIUM = (
		select top(1) y.AUDITORIUM
		from AUDITORIUM as y
		where y.AUDITORIUM_TYPE = y.AUDITORIUM_TYPE
		order by y.AUDITORIUM_CAPACITY desc
	)
order by x.AUDITORIUM_CAPACITY desc;

--5 �������
select FACULTY.FACULTY_NAME
from FACULTY
where exists (
	select * from PULPIT
	where PULPIT.FACULTY = FACULTY.FACULTY
);

---6 �������

select top(1)
	ISNULL((
		select AVG(PROGRESS.NOTE) from PROGRESS
		where PROGRESS.SUBJECT_T = '���'
	), 0) [���],
	ISNULL((
		select AVG(PROGRESS.NOTE) from PROGRESS
		where PROGRESS.SUBJECT_T = '��'
	), 0) [��],
	ISNULL((
		select AVG(PROGRESS.NOTE) from PROGRESS
		where PROGRESS.SUBJECT_T = '����'
	), 0) [����]
from PROGRESS;

--- 7 �������

select AUDITORIUM.AUDITORIUM, AUDITORIUM.AUDITORIUM_CAPACITY
from AUDITORIUM
where AUDITORIUM.AUDITORIUM_CAPACITY <= ALL (
	select AUDITORIUM.AUDITORIUM_CAPACITY
	from AUDITORIUM
	where AUDITORIUM.AUDITORIUM_TYPE = '��-�') 
and AUDITORIUM.AUDITORIUM_TYPE = '��-�';

--- 8 �������

select AUDITORIUM.AUDITORIUM, AUDITORIUM.AUDITORIUM_CAPACITY
from AUDITORIUM
where AUDITORIUM.AUDITORIUM_CAPACITY > ANY (
	select AUDITORIUM.AUDITORIUM_CAPACITY
	from AUDITORIUM
	where AUDITORIUM.AUDITORIUM_TYPE = '��-�') 
and AUDITORIUM.AUDITORIUM_TYPE = '��-�';