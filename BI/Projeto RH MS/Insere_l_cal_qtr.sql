use bi_kivah
go

declare @dataini as date
declare @datafin as date 

declare @id_dim_data int,
		@dia as int,
		@dia_da_semana as int,
		@dia_da_semana_nome  as varchar(7),
		@ano as int,
		@mes as int,
		@mes_nome as varchar(9),
		@mes_nome_abrev as varchar(3),
		@bimestre as int,
		@trimestre as int,
		@semestre as int,
		@dia_util as int,
		@final_semana as int,
		@semana_mes as int,
		@semana_ano as int,
		@qtr_ant as date,
		@mes_ant as int,
		@tri_ant as int,
		@ano_ant as int

set @dataini ='2010-01-01'
set @datafin ='2013-12-31'
set @id_dim_data = 0

while @dataini <= @datafin
begin

	set @id_dim_data = @id_dim_data + 1
	set @dia = day(@dataini)
	set @dia_da_semana = datepart(weekday,@dataini)
	set @ano = year(@dataini)
	set @mes = month(@dataini)
	set @qtr_ant=DATEADD(QUARTER,-1,@dataini)
	set @mes_ant = month(@qtr_ant)	
	set @ano_ant = year(@qtr_ant)

	set @dia_da_semana_nome = case
	when @dia_da_semana =1 then 'domingo'
	when @dia_da_semana =2 then 'segunda'
	when @dia_da_semana =3 then 'terça'
	when @dia_da_semana =4 then 'quarta'
	when @dia_da_semana =5 then 'quinta'
	when @dia_da_semana =6 then 'sexta'
	when @dia_da_semana =7 then 'sábado' end

	set @mes_nome = case 
	when @mes = 1 then 'janeiro'
	when @mes = 2 then 'fevereiro'
	when @mes = 3 then 'março'
	when @mes = 4 then 'abril'
	when @mes = 5 then 'maio'
	when @mes = 6 then 'junho'
	when @mes = 7 then 'julho'
	when @mes = 8 then 'agosto'
	when @mes = 9 then 'setembro'
	when @mes = 10 then 'outubro'
	when @mes = 11 then 'novembro'
	when @mes = 12 then 'dezembro' end

	set @mes_nome_abrev = case 
	when @mes = 1 then 'jan'
	when @mes = 2 then 'fev'
	when @mes = 3 then 'mar'
	when @mes = 4 then 'abr'
	when @mes = 5 then 'mai'
	when @mes = 6 then 'jun'
	when @mes = 7 then 'jul'
	when @mes = 8 then 'ago'
	when @mes = 9 then 'set'
	when @mes = 10 then 'out'
	when @mes = 11 then 'nov'
	when @mes = 12 then 'dez' end

	set @bimestre = case 
	when @mes <= 2 then 1
	when @mes <= 4 then 2
	when @mes <= 6 then 3
	when @mes <= 8 then 4
	when @mes <= 10 then 5
	when @mes <= 12 then 6 end

	set @trimestre = case 
	when @mes <= 3 then 1
	when @mes <= 6 then 2
	when @mes <= 9 then 3
	when @mes <= 12 then 4 end
	
	set @tri_ant = case 
	when @mes_ant <= 3 then 1
	when @mes_ant <= 6 then 2
	when @mes_ant <= 9 then 3
	when @mes_ant <= 12 then 4 end	

	set @semestre = case 
	when @mes <= 6 then 1
	when @mes <= 12 then 2 end

	select @semana_mes = case
	when @dia < 8 then 1
	when @dia < 15 then 2
	when @dia < 22 then 3
	when @dia < 29 then 4
	when @dia < 32 then 5 end

	set @semana_ano = datepart(wk,@dataini)

	set @dia_util = 1
	set @final_semana = 0

	if @dia_da_semana = 1 or @dia_da_semana = 7 
		set @final_semana = 1

	if @final_semana = 1
		set @dia_util = 0
	else if @mes = 1 and @dia = 1 --confraternização universal
		set @dia_util = 0
	else if @mes = 4 and @dia = 21 --tiradentes
		set @dia_util = 0
	else if @mes = 5 and @dia = 1 --trabalho
		set @dia_util = 0
	else if @mes = 9 and @dia = 7 --independência
		set @dia_util = 0
	else if @mes = 10 and @dia = 12 --nossa sra. aparecida
		set @dia_util = 0
	else if @mes = 11 and @dia = 2 --finados
		set @dia_util = 0
	else if @mes = 11 and @dia = 15 --proclamação da república
		set @dia_util = 0
	else if @mes = 12 and @dia = 25 --natal
		set @dia_util = 0

	/*
		feriados sem dia fixo devem ser atualizados manualmente
		ex:
		carnaval 
		paixão de cristo
		corpus christi
	*/

INSERT INTO [bi_kivah].[dbo].[l_cal_qtr]
(
            [qtr_id]
           ,[qtr_desc]
           ,[last_qtr_id]
           ,[year_id]
           ,[qtr_desc_sch]
           ,[qtr_desc_tch]
)
	select 
	cast(@ano as varchar) + cast(@trimestre as varchar) as qtr_id,
	cast(@ano as varchar) + ' Q' + cast(@trimestre as varchar) as qtr_desc,
	cast(@ano_ant as varchar) + cast(@tri_ant as varchar) as last_qtr_id,
	@ano as ano,
	cast(@ano as varchar) + ' Q' + cast(@trimestre as varchar) as qtr_desc_sch,
	cast(@ano as varchar) + ' Q' + cast(@trimestre as varchar) as qtr_desc_tch

	set @dataini = dateadd(QUARTER,1,@dataini)
end