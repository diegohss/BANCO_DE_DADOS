use havik

go

update base
set base.idSubdivisao=46
from CandidatoSite base
where base.idArea=12 and base.idSubdivisao=48
go
update op
set op.idSubdivisao=46
from Oportunidade op
where op.idArea=12 and op.idSubdivisao=48


/*
set base.id_subdivisao=46
from bh_cli_codifica base
where base.id_area=12 and base.id_subdivisao=48
*/
