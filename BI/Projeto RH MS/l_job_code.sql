/*
l_job_code
job_code_id	Cod_Projeto	
job_open_rsn_id	Cod Motivo Abertura	
job_close_rsn_id	Cod Motivo Encerramento	
position_id	Cod Cargo	
job_location_id	Cod Cidade/Estado	Está ligado ao codigo da região (l_emp_region)
job_dptm_id	Cod Departamento	Area-Subdivisao ou Area
job_clearance_id	Classificação do Projeto	Usar o Segmento do Projeto?
job_work_exp	Tempo Experiência	Experiencia nos Requisitos do Projeto
job_open_date	Data Abertura Projeto	
job_close_date	Data Fim Projeto	
emp_transfer_in	Candidato que entrou	Podemos colocar o nome do candidato Placement
emp_transfer_out	Candidato que saiu	
*/
-- l_job_code
-- drop table bi_kivah.dbo.l_job_code  
select distinct base.id job_code_id,
       base.tipo_produto job_open_rsn_id,
       cast(enc.status as int) job_close_rsn_id,
       base.cargo position_id,
       cast(cid.munsinp as int) job_location_id,
       --base.id_cidade job_location_id,
       base.area job_dptm_id,
       base.segmento job_clearance_id,
       req.experiencia job_work_exp,
       base.dt_ini job_open_date,
       base.dt_fim job_close_date,
       cast(plac.id_cliente as char(20)) emp_transfer_in,
	   cast(null as CHAR(20)) emp_transfer_out,
	   ltrim(rtrim(cast(left(base.nome,50) as varchar(50)))) job_name
into bi_kivah.dbo.l_job_code              
from havik.dbo.bc_projeto base

left join havik.dbo.bc_proj_requisitos req on
	req.id_projeto=base.id
	
left join(
select distinct ult.id_cliente,ult.id_projeto,ult.id_status,ult.id_substatus,
       ult.dt_alteracao
from(
select id_projeto,MAX(id) id
from havik.dbo.bh_cli_status
where ((id_status=7 and id_substatus=32 and exibir=1) or
	  (id_status=8 and id_substatus=32 and exibir=1) or
	  (id_status=7 and id_substatus is null and exibir=1))
group by id_projeto)t

left join havik.dbo.bh_cli_status ult on
	ult.id=t.id	
)plac on
 plac.id_projeto=base.id
 
left join(
select ult.id_projeto,
cast(CAST(ult.id_status as varchar(4)) + cast(ult.id_substatus as varchar(4))
as varchar(10)) status
from(
select id_projeto,MAX(id) id
from havik.dbo.bh_proj_status 
group by id_projeto
)t
left join havik.dbo.bh_proj_status ult on
	ult.id=t.id
left join havik.dbo.br_proj_status st on
	st.id=ult.id_status	
left join havik.dbo.br_proj_substatus sub on
	sub.id=ult.id_status	
left join havik.dbo.bc_projeto proj on
	proj.id=t.id_projeto
	
where proj.dt_fim is not null and
	  ult.id_status in (2,4,6)
	
)enc on
	enc.id_projeto=base.id
	
left join havik.dbo.br_cidades cid on
	cid.MUNCOD=base.id_cidade	