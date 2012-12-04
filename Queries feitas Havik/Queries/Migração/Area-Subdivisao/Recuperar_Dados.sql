update bh_cli_profissional
set bh_cli_profissional.id_area=tmp.id_area,
	bh_cli_profissional.id_subdivisao=tmp.id_subdivisao
from bh_cli_profissional2 tmp
where (tmp.id=bh_cli_profissional.id)