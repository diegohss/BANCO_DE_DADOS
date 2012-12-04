/*
l_emp_division
emp_division_id	Cod Divisão
emp_division_desc	Descrição Divisão
emp_division_desc_sch	Outro modo descrição
emp_division_desc_tch	Outro modo descrição
*/
-- l_emp_division
-- drop table bi_kivah.dbo.l_emp_division
select base.id emp_division_id,
       left(base.descricao,30) emp_division_desc,
       '' emp_division_desc_sch,
       '' emp_division_desc_tch
into bi_kivah.dbo.l_emp_division             
from havik.dbo.br_segmento base
