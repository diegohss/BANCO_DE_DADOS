create procedure sp_vw_cli_status
(
@id_cliente int
)
as

SELECT 
	   base.id,
       base.id_cliente,
       base.id_status,
       stat.descricao status,
       base.id_substatus,
       sub.descricao substatus,
       base.dt_agendada,
       base.obs,
       base.dt_alteracao,
       col.nome_usuario
       
FROM bh_cli_status base

left join bc_usuario col on
	col.id=base.id_cliente

left join br_cli_status stat on
	stat.id=base.id_status

left join br_cli_substatus sub on
	sub.id=base.id_substatus
	
where base.id_cliente=@id_cliente	

order by base.dt_alteracao desc