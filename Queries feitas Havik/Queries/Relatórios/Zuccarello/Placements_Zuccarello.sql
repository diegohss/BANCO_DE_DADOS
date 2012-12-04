select distinct base.id_cliente,
	   cli.nome cliente,
	   base.id_projeto,
	   proj.nome projeto,
	   convert(char(10),base.dt_alteracao,23) data_status_placement,
	   isnull(emp.nome,prof.empresa_antiga) empresa

from bh_cli_status base

left join bc_cliente cli on
	cli.id=base.id_cliente
	
left join bc_projeto proj on
	proj.id=base.id_projeto
		
left join bh_cli_profissional prof on
	prof.id_cliente=base.id_cliente		
		
left join bc_empresa_unq emp on
	emp.id=prof.id_empresa
		
where ((base.id_status=7 and base.id_substatus=32) or (base.id_status=7 and base.id_substatus is null) and base.exibir=1)
and
proj.id_empresa=3194
and
proj.responsavel_captacao=36
and
convert(char(10),proj.dt_ini,23)>='2012-01-01'
/*
--and
(prof.id_empresa in (4627,9203,8410) 
--or
(prof.empresa_antiga like '%santander%' or prof.empresa_antiga like '%isban%' 
or prof.empresa_antiga like '%produban%')
)
*/
