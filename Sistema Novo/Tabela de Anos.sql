use havik
go
create table br_ano_formacao
(
ano int
)

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
		@semana_ano as int

set @dataini ='1950-01-01'
set @datafin ='2020-12-31'
set @id_dim_data = 0

while @dataini <= @datafin
begin

	set @id_dim_data = @id_dim_data + 1
	set @dia = day(@dataini)
	set @dia_da_semana = datepart(weekday,@dataini)
	set @ano = year(@dataini)
	set @mes = month(@dataini)

	insert into br_ano_formacao
	select 
	@ano as ano
	set @dataini = dateadd(year,1,@dataini)
end