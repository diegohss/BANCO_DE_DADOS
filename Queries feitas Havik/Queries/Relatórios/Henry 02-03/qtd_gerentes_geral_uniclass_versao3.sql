use havik
go

select distinct cli.id,
	   cli.nome,
	   isnull(hist.empresa,hist.empresa_antiga) ult_empresa,
	   status.id_projeto,
	   status.projeto,
	   status.status,
	   status.substatus,
	   pre.obs pre_entrevista,
	   pre.nome_usuario usuario_pre_entrevista

from bc_cliente cli

left join bh_cli_codifica codi on
	codi.id_cliente=cli.id
	
left join (
select ult.id_cliente,
	   ult.obs,
	   uspre.nome_usuario	   
	   	   
from (select id_cliente,max(id) id
from bh_cli_researcher_obs
group by id_cliente)ult_pre 

left join bh_cli_researcher_obs ult on 
	ult.id=ult_pre.id	
left join bc_usuario uspre on
	uspre.id=ult.usuario_alteracao		
)pre on
	pre.id_cliente=cli.id
	
left join bh_cli_profissional prof on
		prof.id_cliente=cli.id
		
--Profissional
left join (
select ult.id_cliente,
	   ult.id_empresa,
	   emp.nome empresa,
	   ult.empresa_antiga,
	   fil.nome filial,
	   ult.id_cargo,
	   cargo.descricao cargo,
	   ult.salario,
	   ult.bonus,
	   ult.usuario_alteracao,
	   us.nome_usuario
from (
SELECT a.id
FROM bh_cli_profissional a
WHERE a.ID IN
(SELECT TOP 1 b.id FROM bh_cli_profissional b WHERE b.id_cliente = a.id_cliente ORDER BY b.dt_inicio DESC)
)ult_prof
left join bh_cli_profissional ult on
	ult.id=ult_prof.id	
left join br_cargo cargo on
	cargo.id=ult.id_cargo	
left join bc_empresa_unq emp on
	emp.id=ult.id_empresa
left join bc_empresa_filial fil on
	fil.id=ult.id_filial		
left join bc_usuario us on
	us.id=ult.usuario_alteracao	
)hist on
	hist.id_cliente=cli.id
	

-- Status
left join(
select
	ult.id_cliente,
	ult.id_projeto,
	proj.nome projeto,
	ult.id_status,
	st.descricao status,
	ult.id_substatus,
	sub.descricao substatus
from(
select id_cliente,MAX(id) id
from bh_cli_status
group by id_cliente
)ult_st

left join bh_cli_status ult on
	ult.id=ult_st.id

left join br_cli_status st on
	st.id=ult.id_status
	
left join br_cli_substatus sub on
	sub.id=ult.id_substatus
	
left join bc_projeto proj on
	proj.id=ult.id_projeto
	
)status on
	status.id_cliente=cli.id

		
where codi.id_segmento=1 and codi.id_area=12 and codi.id_subdivisao in (44)
	  --and prof.id_cargo in (9) and ((pre.obs like '%backup%') or (pre.obs like '%back up%'))
	  --and cli.id not in (select id_cliente from bh_cli_status  where id_status=8 and id_substatus=6)
	  
order by cli.id	  

