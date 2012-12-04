/*
Diego Henrique Souza Silva
Relatório Visitas Realizadas
09/2012 v1.0
*/
use havik
go
--drop procedure nrel_entrevistas_realizadas
create procedure nrel_entrevistas_realizadas
(
@dt_ini as datetime,
@dt_fim as datetime,
@projeto int=null,
@entrevistador int=null
)
as
begin

select base.nome candidato,
       convert(char(10),q.dt_agendada,23) quando,
       case 
       when left(proj.nome,5)='pro a' then
       'Pró Ativa'
       else
       proj.nome end projeto,       
       seg.descricao industria,
       base.id id_candidato

from bc_cliente base

left join bh_cli_status st on
	st.id_cliente=base.id
	
left join br_cli_status dsta on
	dsta.id=st.id_status	
	
left join br_cli_substatus dsub on
	dsub.id=st.id_substatus	
	
left join bc_projeto proj on
	proj.id=st.id_projeto	

left join br_segmento seg on
	seg.id=proj.segmento
	
left join(
select ult.id_cliente,ult.id_projeto,ult.dt_agendada
from(
select id_cliente,id_projeto,MAX(id) id
from bh_cli_status 
where (id_status in (2,5) and id_substatus in (13,26,27))
group by id_cliente,id_projeto
)t
left join bh_cli_status ult on
	ult.id=t.id	
)q on
	q.id_cliente=st.id_cliente and
	q.id_projeto=st.id_projeto
	
left join bc_cli_consultor entrev on
	entrev.id_cliente=base.id

	
where 
entrev.id_cliente is not null
and
-- Tipo de Status Filtrado
(st.id_status=5 and st.id_substatus in (24,29,40))
and
-- Período
convert(char(10),st.dt_alteracao,23) between 
convert(char(10),@dt_ini,23) and convert(char(10),@dt_fim,23)
-- Filtro Usuario Cadastrou Status
and 
(proj.id=@projeto or @projeto is null)
-- Filtro Entrevistador
and
(st.entrevistador=@entrevistador or @entrevistador is null)


end