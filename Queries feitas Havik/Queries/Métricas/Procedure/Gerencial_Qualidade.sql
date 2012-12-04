-- Relatório Gerencial
-- Query para cálculo da métrica de qualidade
-- No qualidade o usuário 

create procedure [dbo].[sp_extrator_ger_qualidade]
(
@data_ini varchar(10)=null,
@data_fim varchar(10)=null
)
as

select us.nome_usuario,
	   proj.id id_projeto,
	   proj.nome,	   
	   cast(COUNT(distinct base.id)/cast(isnull(proj.qtd_cand_shortlist,0) as decimal(10,2)) as decimal(10,2)) qualidade 

from bh_cli_status base

left join bc_projeto proj on
	proj.id=base.id_projeto
	
left join bc_usuario us on
	us.id=proj.colaborador_responsavel
	
where CONVERT(CHAR(10),proj.dt_prev_shortlist, 23) between @data_ini and @data_fim
and (base.id_status=3 and base.id_substatus=18)	

group by 
	   us.nome_usuario,
	   proj.id,
	   proj.nome,
	   proj.qtd_cand_shortlist


-- where CONVERT(CHAR(10),base.dt_alteracao, 23) between '2011-12-26' and '2012-01-04'
-- and (base.id_status= and base.id_substatus=)
-- 1º Opção = Entrevista Havik - Aprovado Shortlist = 3-18
-- 2º Opção = Shortlist - Aprovado = 4-23