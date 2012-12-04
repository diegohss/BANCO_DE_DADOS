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
select base.id_area emp_dptm_id,
       CAST(null as int) emp_division_id,
       cast(left(area.descricao,30) as CHAR(30)) emp_dptm_desc,
	   CAST(null as CHAR(30)) emp_dptm_desc_sch,
       CAST(null as CHAR(30)) emp_dptm_desc_tch
into bi_kivah.dbo.l_emp_dptm      
from 
(
select cod.id_area
from havik.dbo.bh_cli_codifica cod
where cod.id_area is not null 
group by cod.id_area

)base

left join havik.dbo.br_area area on
	area.id=base.id_area