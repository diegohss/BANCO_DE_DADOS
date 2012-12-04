use havik

go

create view vw_relat_tipos
as
select top 30 id, descricao

from br_relat_tipos

order by descricao