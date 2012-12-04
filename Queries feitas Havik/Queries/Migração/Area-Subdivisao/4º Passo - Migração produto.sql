update bh_cli_profissional
set bh_cli_profissional.id_area=prod.area,
	bh_cli_profissional.id_subdivisao=prod.subdivisao
from temp_depara_produtos prod	
where (bh_cli_profissional.produto is not null and bh_cli_profissional.produto<>'') 
      and bh_cli_profissional.produto=prod.produto