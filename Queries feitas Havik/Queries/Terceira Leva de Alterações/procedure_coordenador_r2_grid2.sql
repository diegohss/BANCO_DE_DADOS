create procedure sp_vw_home_coordenador_2
(
@usuario int
)

as

select  	
	   base.id_empresa,
	   base.id id_projeto,	
	   emp.razao_social empresa,
	   base.nome projeto,
	   entrega.nome_usuario responsavel_entrega,
	   col.nome_usuario colaborador_responsavel,
	   sta.descricao ultimo_status,
	   sub.descricao ultimo_substatus,	   
	   base.dt_ini,
	   base.dt_fim
	   
from bc_projeto base

left join bc_empresa_unq emp on
	emp.id=base.id_empresa

left join br_proj_status sta on
	sta.id=base.ultimo_status

left join br_proj_substatus sub on
	sub.id=base.ultimo_substatus
	
left join bc_usuario col on
	col.id=base.colaborador_responsavel

left join bc_usuario entrega on	
	entrega.id=base.responsavel_entrega
	
where (base.colaborador_responsavel in (select u.id from bc_usuario u where u.cargo='r1'))

order by 9,3