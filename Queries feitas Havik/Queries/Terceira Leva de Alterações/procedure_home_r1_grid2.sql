alter procedure sp_vw_home_r1_2
(
@usuario int
)

as

select  	
	   base.id_empresa,
	   base.id id_projeto,	
	   emp.razao_social empresa,
	   base.nome projeto,
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
	
left join bc_usuario us on
	us.id=@usuario

where base.colaborador_responsavel=@usuario

order by 7,3