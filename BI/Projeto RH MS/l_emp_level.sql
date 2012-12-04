/*
l_emp_level
emp_level_id	Cod Nível Cargo
emp_level_desc	Descrição Nível Cargo
emp_level_desc_sch	Outro modo descrição
emp_level_desc_tch	Outro modo descrição
*/
-- l_emp_level
-- drop table bi_kivah.dbo.l_emp_level
select base.id emp_level_id,
       cast(left(base.descricao,20) as CHAR(20)) emp_level_desc,
       '' emp_level_desc_sch,
       '' emp_level_desc_tch
into bi_kivah.dbo.l_emp_level       
from havik.dbo.br_cargo base