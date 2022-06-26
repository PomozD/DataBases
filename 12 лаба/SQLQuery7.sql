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
GO
CREATE procedure PSUBJECT_3 @param varchar(20) AS
BEGIN
DECLARE @count int;
SET @count = (SELECT COUNT(*) FROM SUBJECT_T WHERE SUBJECT_T.PULPIT = @param);
PRINT 'Params: @p = ' + @param + ' @c = ' + CAST(@count as varchar(5));
SELECT * FROM dbo.SUBJECT_T WHERE SUBJECT_T.PULPIT = @param;
END;
CREATE TABLE #SUBJECT (
SUBJ varchar(10) NOT NULL,
SUBJ_NAME varchar(100),
PULP varchar(10) NOT NULL
);
INSERT #SUBJECT EXEC PSUBJECT_3 @param = 'ศั่า';
SELECT * FROM #SUBJECT;