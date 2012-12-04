use havik
go
create procedure sp_vw_relat_descrelat
(
@tipo int=null
)
as

select base.obs

from br_relat_tipos base

where base.id=@tipo