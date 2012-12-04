use havik

go

/*
O Henry precisa com urgência da pesquisa abaixo:
Segmento bancos
Área credito
Subsegmento  back office,analise de credito e modelagem de credito
*/

select distinct cli.id id_cliente,
	   cli.nome candidato,
	   st.dt_alteracao dt_ultimo_status

from bc_cliente cli

left join bh_cli_codifica prof on
	prof.id_cliente=cli.id
	
left join(
select stat.id_cliente,
	   stat.id_status,
	   stat.id_substatus,
	   stat.dt_alteracao	   
from(
select t.id_cliente,MAX(t.id) id
from bh_cli_status t
group by t.id_cliente
)ult
left join bh_cli_status stat on
	stat.id=ult.id
)st on
	st.id_cliente=cli.id	
	
where (prof.id_segmento=1 and ((prof.id_area=4 and prof.id_subdivisao=23) or (prof.id_area=4 and prof.id_subdivisao=54)
or (prof.id_area=4 and prof.id_subdivisao=56)
))
	   
order by st.dt_alteracao desc	   