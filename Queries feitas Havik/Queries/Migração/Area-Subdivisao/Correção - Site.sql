/*update bc_projeto
set bc_projeto.subdivisao=sub.sub_nova
from subdivisao sub
where sub.sub_antiga=bc_projeto.subdivisao

go*/

update prof
set prof.id_subdivisao=sub.sub_nova
from bh_cli_profissional prof
inner join bc_cliente cli on
	cli.id=prof.id_cliente
left join subdivisao sub on
	prof.id_subdivisao=sub.sub_antiga
where 
cli.id_antiga is not null
and CONVERT(CHAR(10),cli.dt_alteracao,23) between '2011-12-27' and '2012-01-03'
and sub.sub_antiga=prof.id_subdivisao
/*
update prof
set prof.id_area=area.area_nova
from bh_cli_profissional prof
left join temp_depara_area2 area on
	prof.id_area=area.area_antiga
inner join bc_cliente cli on
	cli.id=prof.id_cliente
where cli.id_antiga is not null
and CONVERT(CHAR(10),cli.dt_alteracao,23) between '2011-12-27' and '2012-01-03'
and  area.area_antiga=prof.id_area */