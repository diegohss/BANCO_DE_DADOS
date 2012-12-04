/*
l_emp_dptm
emp_dptm_id	Cod Departamento Area-Subdivisao ou Area
emp_division_id	Cod Divisão Segmento
emp_dptm_desc	Descrição Departamento
emp_dptm_desc_sch	Outro modo descrição
emp_dptm_desc_tch	Outro modo descrição
*/
-- l_emp_dptm
-- drop table bi_kivah.dbo.l_emp_dptm 
select base.id emp_dptm_id,
       ver.id_segmento emp_division_id,
       cast(left(area.descricao,30) as CHAR(30)) emp_dptm_desc,
	   CAST(null as CHAR(30)) emp_dptm_desc_sch,
       CAST(null as CHAR(30)) emp_dptm_desc_tch
--into bi_kivah.dbo.l_emp_dptm      
from havik.dbo.bl_area_subdivisao base

left join havik.dbo.br_area area on
	area.id=base.id_area
	
left join(
select cod.id_area,cod.id_subdivisao,cod.id_segmento
from havik.dbo.bh_cli_codifica cod
where cod.id_area is not null 
group by cod.id_area,cod.id_subdivisao,cod.id_segmento
)ver on
	ver.id_area=base.id_area and
	ver.id_subdivisao=base.id_subdivisao
order by 1	