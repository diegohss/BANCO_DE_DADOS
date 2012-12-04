use havik_teste
go
create procedure sp_vw_proj_aliquota
(
@id_imposto int = null
)
as
select aliquota
from br_impostos imp
where imp.id=@id_imposto
