use havik

go

select distinct cli.id id_cliente,
	   cli.nome candidato,
	   st.dt_alteracao dt_status

from bc_cliente cli

left join bh_cli_profissional prof on
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
	
where ((st.id_status=2 and st.id_substatus=7) or (st.id_status=2 and st.id_substatus=49)) and
	   (prof.id_cargo=9 and prof.id_segmento=1 and ((prof.id_area=12 and prof.id_subdivisao=44) or (prof.id_area=12 and prof.id_subdivisao=51)))
	   
order by st.dt_alteracao desc	   