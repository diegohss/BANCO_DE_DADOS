-- Areas 1 e 11
-- 1/26 = 11/109
-- Deletar a área 1
use havik
go
update base
set base.id_subdivisao=46
from bh_cli_codifica base
where base.id_area=12 and base.id_subdivisao=48
go
update proj
set proj.subdivisao=46
from bc_projeto proj
where proj.area=12 and proj.subdivisao=48
go
update prof
set prof.id_subdivisao=46
from bh_cli_profissional prof
where prof.id_area=12 and prof.id_subdivisao=48
