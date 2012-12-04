-- Relatório Analítico
-- métrica de quantidade

select proj.colaborador_responsavel,
	   proj.id id_projeto,
	   proj.nome,	   
	   base.id_status,
	   base.id_substatus   

from bh_cli_status base

left join bc_projeto proj on
	proj.id=base.id_projeto
	
left join bc_usuario us on
	us.id=proj.colaborador_responsavel
	
where
CONVERT(CHAR(10),proj.dt_prev_shortlist, 23) between '2012-01-01' and '2012-02-20'
and
proj.colaborador_responsavel is not null


-- 1º Opção = Entrevista Havik - Aprovado Shortlist = 3-18
-- 2º Opção = Shortlist - Aprovado = 4-23