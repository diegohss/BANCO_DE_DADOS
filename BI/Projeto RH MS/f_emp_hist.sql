/*
f_emp_hist
employee_id	Cod Candidato	
emp_dptm_id	Cod Departamento	Area-Subdivisão ou Area
emp_location_id	Cod Localização	Cidade / Estado
emp_sts_id	Cod Status Candidato	Ativo/Inativo
month_id	Cod Mês	
last_dptm_id	Cod Ultima Departamento	Area-Subdivisão ou Area
last_location_id	Cod Ultima Localidade	Estado/Cidade
seniority	Ranking Historico Mais Recente	
dptm_transfer_flg	??	
loc_transfer_flg	??	
*/
-- f_emp_hist
-- drop table bi_kivah.dbo.f_emp_hist
select DISTINCT base.id employee_id,
       cod.id_area emp_dptm_id,
       cast(cid.munsinp as int) emp_location,
       --base.id_cidade emp_location,
       1 emp_sts_id,
       tempo.anomes month_id,
       ultcod.id_area last_dptm_id,
       cast(cid.munsinp as int) last_location_id,
       case when plac.id_cliente is null then
       0
       else 1 end seniority,
       0 dptm_transfer_flg,
       0 loc_transfer_flg
       
into bi_kivah.dbo.f_emp_hist
from havik.dbo.bc_cliente base

left join havik.dbo.bh_cli_codifica cod on
	cod.id_cliente=base.id
	
left join
(
select ult.id_cliente,ult.id_area,ult.dt_alteracao
from(
select id_cliente,MAX(id) id
from havik.dbo.bh_cli_codifica 
where exibir=1
group by id_cliente
)t
left join havik.dbo.bh_cli_codifica ult on
	ult.id=t.id
)ultcod on
	ultcod.id_cliente=base.id	
	
left join(
select id_cliente,MAX(id) id
from havik.dbo.bh_cli_status
where ((id_status=7 and id_substatus=32 and exibir=1) or
	  (id_status=8 and id_substatus=32 and exibir=1) or
	  (id_status=7 and id_substatus is null and exibir=1))
group by id_cliente
)plac on
	plac.id_cliente=base.id
	
left join havik.dbo.br_cidades cid on
	cid.MUNCOD=base.id_cidade	
	
left join bi_kivah.dbo.dim_tempo tempo on
	tempo.anomes=convert(char(6),cod.dt_alteracao,112)	
	
where base.id is not null