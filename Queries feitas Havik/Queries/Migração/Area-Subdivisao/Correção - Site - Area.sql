/*
update bc_projeto
set bc_projeto.area=area.area_nova
from temp_depara_area2 area
where area.area_antiga=bc_projeto.area

go
*/
update prof
set prof.id_area=area.area_nova
from bh_cli_profissional prof
left join temp_depara_area2 area on
	prof.id_area=area.area_antiga
inner join bc_cliente cli on
	cli.id=prof.id_cliente
where cli.id_antiga is not null
and CONVERT(CHAR(10),cli.dt_alteracao,23) between '2011-12-27' and '2012-01-03'
and  area.area_antiga=prof.id_area 

/*
update cur
set cur.dados=can.curriculum
from site.candidatosite can
inner join bc_cliente cli on
	cli.id_antiga=can.idCandidatoSite
inner join bc_cli_base_cvs cur
on cur.id_cliente=cli.id
*/


