use havik
go
create procedure [dbo].[sp_vw_relat_empresa]
(
@projeto int_list readonly
)
as
select distinct emp.id id_empresa,emp.nome empresa

from bc_projeto proj

left join bc_empresa_unq emp on
	emp.id=proj.id_empresa

where proj.id in (select n from @projeto)	