-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE <Procedure_Name, sysname, ProcedureName> 
	-- Add the parameters for the stored procedure here
	<@Param1, sysname, @p1> <Datatype_For_Param1, , int> = <Default_Value_For_Param1, , 0>, 
	<@Param2, sysname, @p2> <Datatype_For_Param2, , int> = <Default_Value_For_Param2, , 0>
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT <@Param1, sysname, @p1>, <@Param2, sysname, @p2>
END
GO
create procedure SUBJECT_REPORT  @p CHAR(10)
   as  
   declare @rc int = 0;                            
   begin try    
      declare @tv char(20), @t char(300) = ' ';  
	  IF CURSOR_STATUS('global','ZkTov')>=-1
			BEGIN
				DEALLOCATE ZkTov
			END
      declare ZkTov CURSOR  for 
      select SUBJECT_T from SUBJECT_T where PULPIT = @p;
      if not exists ( select SUBJECT_T from SUBJECT_T where PULPIT = @p)
          raiserror('������', 11, 1);
       else 
		  open ZkTov;	  
			  fetch  ZkTov into @tv;   
			  print   '�������� �� �������';   
			  while @@fetch_status = 0                                     
			   begin 
				   set @t = rtrim(@tv) + ', ' + @t;  
				   set @rc = @rc + 1;       
				   fetch  ZkTov into @tv; 
				end;   
				print @t;        
			close  ZkTov;
		return @rc;
   end try  
   begin catch              
        print '������ � ����������' 
        if error_procedure() is not null   
			 print '��� ��������� : ' + error_procedure();
			 print '��� ������ : '+ cast(error_number() as varchar(6));
			 print '��������� : '+ error_message();
			 print '������� : '+ cast(error_severity() as varchar(8));
        return @rc;
   end catch; 


declare @rc2 int;  
exec @rc2 = SUBJECT_REPORT @p  = '���';  
print '���������� ��������� = ' + cast(@rc2 as varchar(3)); 
exec @rc2 = SUBJECT_REPORT @p  = '��';  
print '���������� ��������� = ' + cast(@rc2 as varchar(3)); 
exec @rc2 = SUBJECT_REPORT @p  = '����';  
print '���������� ��������� = ' + cast(@rc2 as varchar(3)); 