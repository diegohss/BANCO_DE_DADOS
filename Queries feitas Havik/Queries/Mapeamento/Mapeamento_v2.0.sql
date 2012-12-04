-- Query dos dados de mapeamento
create procedure sp_extrator_mapeamento
(
@id_projeto int
)
as
select 
proj.id id_projeto,
proj.nome projeto,
cli.nome nome_cliente,
isnull(prof.empresa,prof.empresa_antiga) empresa,
prof.filial,
prof.cargo,
prof.salario,
prof.bonus,
dt_inicio=dbo.fn_dateformat(prof.dt_inicio,1),
dt_saida=dbo.fn_dateformat(prof.dt_saida,1),
DATEDIFF(year,cli.dt_nascimento,getdate()) Idade,
esc.descricao escolaridade,
grad.descricao graduacao,
acad.instituicao,
cur.curso certificacoes,
tidi.descricao idioma,
idi.id_nvl_idioma nivel_idioma,
status.status,
status.substatus,
status.dt_alteracao data

from bh_cli_projeto cproj


-- Ultimo Status
left join (
select ult.id,
	   ult.id_projeto,	
	   ult.id_cliente,	
       ult.id_status,
       dsta.descricao status,
       ult.id_substatus,
       dsub.descricao substatus,
       ult.dt_alteracao,
       us.nome_usuario usuario_status    
		
from (select ult.id_cliente,max(ult.id) id
from bh_cli_status ult
where ult.id_projeto=@id_projeto group by ult.id_cliente)ult_st

left join bh_cli_status ult on
	ult.id=ult_st.id

left join br_cli_status dsta on
	dsta.id=ult.id_status
	
left join br_cli_substatus dsub on
	dsub.id=ult.id_substatus
	
left join bc_usuario us on
	us.id=ult.usuario_criacao	
)status on
	status.id_cliente=cproj.id_cliente and
	status.id_projeto=cproj.id_projeto

--Profissional
left join (
select ult.id_cliente,
	   ult.id_empresa,
	   emp.nome empresa,
	   ult.empresa_antiga,
	   fil.nome filial,
	   ult.dt_inicio,
	   ult.dt_saida,
	   ult.id_cargo,
	   cargo.descricao cargo,
	   ult.salario,
	   ult.bonus,	   
	   ult.id_segmento,
	   seg.descricao segmento,
	   ult.id_area,
	   area.descricao area,
	   ult.id_subdivisao,
	   sub.descricao subdivisao
from (
SELECT a.id
FROM bh_cli_profissional a
WHERE a.ID IN
(SELECT TOP 1 b.id FROM bh_cli_profissional b WHERE b.id_cliente = a.id_cliente ORDER BY b.dt_inicio DESC)
)ult_prof
left join bh_cli_profissional ult on
	ult.id=ult_prof.id	
left join br_area area on
	area.id=ult.id_area	
left join br_cargo cargo on
	cargo.id=ult.id_cargo	
left join br_subdivisao sub on
	sub.id=ult.id_subdivisao	
left join br_segmento seg on
	seg.id=ult.id_segmento
left join bc_empresa_filial fil on
	fil.id=ult.id_filial		
left join bc_empresa_unq emp on
	emp.id=ult.id_empresa	
)prof on
	prof.id_cliente=cproj.id_cliente

-- Parte Academica
left join bh_cli_cursos cur on
	cur.id_cliente=cproj.id_cliente

left join bh_cli_academico acad on
	acad.id_cliente=cproj.id_cliente
	
left join br_graduacao grad on
	grad.id=acad.id_graduacao	
	
left join br_escolaridade esc on
	esc.id=acad.id_escolaridade	
	
left join bh_cli_idiomas idi on
	idi.id_cliente=cproj.id_cliente

left join br_idiomas tidi on		
	tidi.id=idi.id_idioma

-- Parte Cliente
left join bc_cliente cli on
	cli.id=cproj.id_cliente
	
-- Parte Projeto
left join bc_projeto proj on
	proj.id=cproj.id_projeto	
	
where cproj.id_projeto=@id_projeto

group by
proj.id,
proj.nome,
cli.nome,
isnull(prof.empresa,prof.empresa_antiga),
prof.filial,
prof.cargo,
prof.salario,
prof.bonus,
prof.dt_inicio,
prof.dt_saida,
DATEDIFF(year,cli.dt_nascimento,getdate()),
esc.descricao,
grad.descricao,
acad.instituicao,
cur.curso,
tidi.descricao,
idi.id_nvl_idioma,
status.status,
status.substatus,
status.dt_alteracao