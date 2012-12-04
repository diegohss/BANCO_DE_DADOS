use havik_teste
go
create procedure sp_vw_cli_anexos
(
@id_cliente int
)
as
select idi.descricao tipo,
	   COUNT(cvs.id) qtd

from bc_cli_base_cvs cvs

left join br_cli_cvs_idiomas idi on
	idi.id=cvs.idioma
	
where cvs.id_cliente=@id_cliente
	
group by idi.descricao	