use havik
go
create procedure sp_vw_cli_pergunta
(
@id_cliente int = null
)
as
select base.id_pergunta,
	   per.descricao pergunta 

from bl_cli_perguntas_respostas base

left join br_cli_perguntas per on
	per.id=base.id_pergunta
	
where convert(char(10),getdate(),23) between convert(char(10),base.dt_ini,23) and convert(char(10),base.dt_fim,23)