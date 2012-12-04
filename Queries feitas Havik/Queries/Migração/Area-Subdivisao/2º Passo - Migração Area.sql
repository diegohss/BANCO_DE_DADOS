update bc_projeto
set bc_projeto.area=area.area_nova
from temp_depara_area2 area
where area.area_antiga=bc_projeto.area

go

update bh_cli_profissional
set bh_cli_profissional.id_area=area.area_nova
from temp_depara_area2 area
where area.area_antiga=bh_cli_profissional.id_area


