/*
l_contractor
contractor_id	Cod Contratante	Pode ser usado como código empresa ou do responsavel pelo projeto
contractor_desc	Descrição Contratante	
contract_start_date	Data Inicio Contrato	
contract_end_date	Data Final Contrato	
cntr_activity	Contrato em Atividade	Sim/Não
cntr_location_id	Cod Localização Contratante	Estado/Cidade
cntr_dept_id	Cod Departamento Contratante	Area-Sudivisão ou Area
cntr_title_id	Cod Cargo	
salary_rate	Fee	
*/
-- l_contractor
-- drop table bi_kivah.dbo.l_contractor 
select distinct base.id contractor_id,
       cast(left(base.nome,30) as CHAR(30)) contractor_desc,
       proj.dt_ini contract_start_date,
       proj.dt_fim contract_end_date,
       case when proj.id_empresa is null then
       0
       else 1 end cntr_activity,
       cast(cid.munsinp as int) cntr_location_id,
       --base.cidade cntr_location_id,
       proj.area cntr_dept_id,
       proj.cargo cntr_title_id,
       cast(proj.salario_mensal as float) salary_rate
into bi_kivah.dbo.l_contractor           
from havik.dbo.bc_empresa_unq base

left join
(
select ult.id_empresa,ult.dt_ini,ult.dt_fim,ult.cargo,ofer.salario_mensal,ult.area
from(
select p.id_empresa,max(p.id) id
from havik.dbo.bc_projeto p
group by p.id_empresa
)t
left join havik.dbo.bc_projeto ult on
	ult.id=t.id
left join havik.dbo.bc_proj_oferta ofer on
	ofer.id_projeto=ult.id	

)proj on
	proj.id_empresa=base.id
	
left join havik.dbo.br_cidades cid on
	cid.muncod=base.cidade	



