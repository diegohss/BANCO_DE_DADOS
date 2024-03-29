USE [havik_teste]
GO
/****** Object:  UserDefinedFunction [dbo].[contar_duteis]    Script Date: 02/03/2012 16:17:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER function [dbo].[contar_duteis](@dtini datetime,@dtfim datetime)
RETURNS INT
AS
BEGIN
 
Declare @total Int
declare @inc int
Declare @data date
declare @semana varchar(20)
set @total=0
set @inc=0
set @data=@dtini
 
--Set Datefirst 1
 
While convert(char(10),@dtfim,23) >= convert(char(10),@data,23)
Begin
	set @semana=DATENAME(dw,@data)
  if lower(@semana)='saturday' or lower(@semana)='sunday'
	begin
		set @inc=0
	end
  else
	begin
		set @inc=1
	end	
	
if (select count(*) from feriados where convert(char(10),feriadosdate,23)=convert(char(10),@data,23))>=1
	begin
		set @inc=0
	end			
Set @data = DATEADD(day,1,@data)
set @total=@total+@inc
End 
 
	 return(@total)
end