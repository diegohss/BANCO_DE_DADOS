use havik

go

create procedure sp_vw_relat_status
as
select id, descricao 

from br_cli_status

order by ranking
