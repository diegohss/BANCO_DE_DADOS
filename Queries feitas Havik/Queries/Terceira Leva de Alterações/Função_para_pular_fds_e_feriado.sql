use havik

go

alter FUNCTION dbo.duteis(@data datetime,@dias int)
RETURNS INT
AS
BEGIN


declare @qtd int
declare @teste int
declare @novodia datetime
declare @temp datetime
declare @total int
declare @semana varchar(12) 

set @novodia=dateadd(day,@dias,@data)

set @teste=0
set @qtd=0
set @total=0

while @teste=0
begin
--set @teste=1
set @semana=DATENAME(dw,@novodia)

if lower(@semana)='saturday' or lower(@semana)='sunday'
	begin
	set @teste=0
	end
	else
	begin 
	set @teste=1
	end
	
if (select count(*) from feriados where feriadosdate=@novodia)>=1
	begin
		set @teste=0
	end	
	
if @teste=0
	begin
	set @qtd=@qtd+1
	set @temp=@novodia
	set @novodia=dateadd(day,@qtd,@temp)	
	end
	
end
	 set @total=@qtd+@dias
	 return(@total)
end
