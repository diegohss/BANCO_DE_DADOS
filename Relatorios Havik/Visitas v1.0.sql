/*
Diego Henrique Souza Silva
Relatório Visitas Realizadas
09/2012 v1.0
*/
use havik
go
--drop procedure nrel_visitas_realizadas
create procedure nrel_visitas_realizadas
(
@dt_ini as datetime,
@dt_fim as datetime,
@empresa int=null,
@usuario int=null
)
as
begin
select distinct base.nome empresa,
	   seg.descricao segmento,
	   us.nome_usuario colaborador_status,
       CONVERT(char(10),st.dt_alteracao,23) data_status,
       st.obs result_obtidos_esperados,
       CAST(isnull(dst.descricao,'') + '-' + isnull(dsub.descricao,'') as varchar(100)) status_acao,
       convert(char(10),st.dt_agendada,23) quando

from bc_empresa_unq base

left join bh_emp_status st on
	st.id_empresa=base.id
	
left join br_segmento seg on
	seg.id=base.segmento	
	
left join br_emp_status dst on
	dst.id=st.id_status
	
left join br_emp_status dsub on
	dsub.id=st.id_substatus
	
left join bc_usuario us on
	us.id=st.usuario_alteracao			
	
where 
-- Tipo Status Filtrado
st.id_status=2 and
-- Período
convert(char(10),st.dt_alteracao,23) between 
convert(char(10),@dt_ini,23) and convert(char(10),@dt_fim,23)
-- Filtro Usuario Cadastrou Status
and 
(base.id=@empresa or @empresa is null)
-- Filtro usuario
and
(st.usuario_alteracao=@usuario or @usuario is null)

end
