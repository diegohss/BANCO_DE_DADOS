/*
f_emp_level
emp_level_id	Cod Nivel Cargo
year_id	Cod Ano
level_max_salary	Faixa Máxima Salario
level_min_salary	Faixa Mínima Salario
level_ind_std	Faixa Média Salario
*/
-- f_emp_level
-- drop table bi_kivah.dbo.f_emp_level
select base.id_cargo emp_level_id,
       cast(tempo.ano as int) year_id,
       cast(max(base.salario) as float) level_max_salary,
       cast(AVG(base.salario) as float) level_min_salary,
       cast(MIN(base.salario) as float) level_ind_std
into bi_kivah.dbo.f_emp_level
from havik.dbo.bh_cli_profissional base

left join bi_kivah.dbo.dim_tempo tempo on
	tempo.ano=isnull(year(base.dt_inicio),year(base.dt_saida))
where base.id_cliente is not null and base.id_cliente<32000
group by base.id_cargo,
         tempo.ano