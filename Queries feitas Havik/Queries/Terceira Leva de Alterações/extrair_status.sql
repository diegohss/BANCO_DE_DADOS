create procedure sp_vw_extrair_info_status
(
@data datetime = null
)
as
begin

select
	   col.nome_usuario,
	   cli.nome nome_candidato,	
	   base.id_status status,
	   sta.descricao status,
	   base.id_substatus,
	   sub.descricao substatus,
	   base.dt_alteracao data	   	

from bh_cli_status base

left join br_cli_status sta on
	sta.id=base.id_status
	
left join br_cli_substatus sub on
	sub.id=base.id_substatus	
	
left join bc_cliente cli on
	cli.id=base.id_cliente
		
left join bc_usuario col on
	col.id=base.usuario_criacao	
	
where convert(char(10),base.dt_alteracao,103)=convert(char(10),@data,103)

end