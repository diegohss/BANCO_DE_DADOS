-- Areas 1 e 11
-- 1/26 = 11/109
-- Deletar a área 1
use havik
go
update base
set base.id_area=11/*,
	base.id_subdivisao=109*/
from bh_cli_codifica base
where base.id_area=1 /*and base.id_subdivisao=26*/
go
update proj
set proj.area=11,
	proj.subdivisao=109
from bc_projeto proj
where proj.area=1
go
update prof
set prof.id_area=11/*,
	prof.id_subdivisao=109*/
from bh_cli_profissional prof
where prof.id_area=1 /*and prof.id_subdivisao=26*/
