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
use UNIVER;
SET nocount on;
GO
CREATE procedure PAUDITORIUM_INSERT @a char(20), @n varchar(50), @c int = 0, @t char(10) AS
BEGIN
BEGIN try
INSERT into AUDITORIUM(AUDITORIUM,AUDITORIUM_NAME,AUDITORIUM_CAPACITY,AUDITORIUM_TYPE)
values(@a, @n, @c, @t);
RETURN 1;
END try
BEGIN catch
print 'Error number: ' + cast(ERROR_NUMBER() as varchar(6));
print 'Error message: ' + ERROR_MESSAGE();
print 'Error line: ' + cast(ERROR_LINE()as varchar(8));
if ERROR_PROCEDURE() is not null
print 'Error procedure: ' + ERROR_PROCEDURE();
print 'Error secerity: ' + cast(ERROR_SEVERITY()as varchar(6));
print 'Error state: ' + cast(ERROR_STATE()as varchar(8));
RETURN -1;
END CATCH
END;
DECLARE @paud int = 0;
EXEC @paud = PAUDITORIUM_INSERT @a='423-1',@n='423-1',@c='90',@t='À - ';
DELETE AUDITORIUM where AUDITORIUM_NAME='423-1';
Select * from AUDITORIUM;