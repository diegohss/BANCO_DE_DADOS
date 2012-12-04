--i.	Id Projeto
--ii.	Nome Projeto (novo campo)
--iii.	Nome do Candidato
--iv.	Média pré-entrevista
--v.	Responsável (pela pré-entrevista)
--vi.	Status (definir se último)
--vii.	Substatus
--viii.	Motivo
--ix.	Quebrar por projeto e status

use havik
select base.id_projeto,
	   proj.nome projeto,
	   cli.nome candidato,
	   media.media_potencial,
	   media.media_comunicacao,
	   pre.usuario responsavel_pre_entrevista,
	   dt_pre_entrevista=dbo.fn_dateformat(pre.dt_alteracao,1),
	   status.status,
	   status.substatus,
	   status.motivo,
	   cap.nome_usuario resp_captacao,	   	   
	   entr.nome_usuario resp_entrega
	   
from bh_cli_projeto base

-- Ultimo Status
left join (
select ult.id,
	   ult.id_projeto,	
	   ult.id_cliente,	
       ult.id_status,
       dsta.descricao status,
       ult.id_substatus,
       dsub.descricao substatus,
       fl.nome_usuario follow,
       ent.nome_usuario entrevistador,
       mot.descricao motivo,
       ult.dt_agendada,
       ult.hora,
       ult.dt_alteracao,
       us.nome_usuario usuario_status       
		
from (select ult.id_cliente,max(ult.id) id
from bh_cli_status ult
where ult.id_projeto=1480
group by ult.id_cliente)ult_st

left join bh_cli_status ult on
	ult.id=ult_st.id

left join br_cli_status dsta on
	dsta.id=ult.id_status
	
left join br_cli_substatus dsub on
	dsub.id=ult.id_substatus
	
left join bc_usuario us on
	us.id=ult.usuario_criacao	
	
left join br_cli_motivos mot on
	mot.id=ult.id_motivo
	
left join bc_usuario fl on
	fl.id=ult.follow
	
left join bc_usuario ent on
	ent.id=ult.entrevistador
				
)status on
	status.id_cliente=base.id_cliente and
	status.id_projeto=base.id_projeto
	
--Media Geral
-- Pre-Entrevista
left join(
select distinct
base.id_cliente,
sum(case when base.c_senso>0 then 1 else 0 end)+
sum(case when base.c_eloquencia>0 then 1 else 0 end)+
sum(case when base.c_objetivo>0 then 1 else 0 end)+	     
sum(case when base.c_energia>0 then 1 else 0 end)+
sum(case when base.c_ouvinte>0 then 1 else 0 end)+
sum(case when base.c_mkt>0 then 1 else 0 end)+
sum(case when base.c_credibilidade>0 then 1 else 0 end)+
sum(case when base.c_estruturado>0 then 1  else 0 end) qtd_comunicacao,
sum(case when base.p_inteligencia>0 then 1 else 0 end)+
sum(case when base.p_maturidade>0  then 1 else 0 end)+
sum(case when base.p_visao>0  then 1 else 0 end)+
sum(case when base.p_confianca>0  then 1 else 0 end)+
sum(case when base.p_honestidade>0  then 1 else 0 end)+
sum(case when base.p_punch>0  then 1 else 0 end)+
sum(case when base.p_carisma>0  then 1 else 0 end) qtd_potencial,

cast(cast(sum(isnull(base.c_senso,0) + isnull(base.c_eloquencia,0) + isnull(base.c_objetivo,0) +
isnull(base.c_energia,0) + isnull(base.c_ouvinte,0) + isnull(base.c_mkt,0) + 
isnull(base.c_credibilidade,0) + isnull(base.c_estruturado,0)) as decimal(10,2))
/ cast(8*COUNT(base.id_cliente) as decimal(10,2)) as decimal(10,2)) media_comunicacao,

cast(cast(sum(isnull(base.p_inteligencia,0) + isnull(base.p_maturidade,0) + isnull(base.p_visao,0) + 
isnull(base.p_confianca,0) + isnull(base.p_honestidade,0) + isnull(base.p_punch,0) + isnull(base.p_carisma,0)) as decimal(10,2)) 
/ cast(7*COUNT(base.id_cliente) as decimal(10,2)) as decimal(10,2)) media_potencial

from bc_cli_researcher base

group by 
base.usuario_alteracao,
base.id_cliente
)media on	
	media.id_cliente=base.id_cliente
	
-- Tabela de Projetos
left join bc_projeto proj on
	proj.id=base.id_projeto
	
left join bc_usuario entr on
	entr.id=proj.responsavel_entrega
	
left join bc_usuario cap on
	cap.id=proj.responsavel_captacao
		
	
-- Tabela de Clientes
left join bc_cliente cli on
	cli.id=base.id_cliente

-- Pré Entrevista

left join(
select ult.id_cliente,
	   ult.dt_alteracao,
	   us.nome_usuario usuario
	   
from (
select id_cliente,MAX(id) id
from bc_cli_researcher
group by id_cliente
)ult_st

left join bc_cli_researcher ult on
	ult.id=ult_st.id
	
left join bc_usuario us on
	us.id=ult.usuario_alteracao
		
)pre on
	pre.id_cliente=base.id_cliente
	
where base.id_projeto=1480	

order by cli.nome