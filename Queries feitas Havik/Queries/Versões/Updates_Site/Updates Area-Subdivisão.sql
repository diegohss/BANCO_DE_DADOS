use havik
go

update base
set base.idArea=11,
	base.idSubdivisao=109
from CandidatoSite base
where base.idArea=1 and base.idSubdivisao=26
go
update op
set op.idArea=11,
	op.idSubdivisao=109
from Oportunidade op
where op.idArea=1 and op.idSubdivisao=26
