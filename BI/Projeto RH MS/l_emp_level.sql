/*
l_emp_level
emp_level_id	Cod N�vel Cargo
emp_level_desc	Descri��o N�vel Cargo
emp_level_desc_sch	Outro modo descri��o
emp_level_desc_tch	Outro modo descri��o
*/
-- l_emp_level
-- drop table bi_kivah.dbo.l_emp_level
select base.id emp_level_id,
       cast(left(base.descricao,20) as CHAR(20)) emp_level_desc,
       '' emp_level_desc_sch,
       '' emp_level_desc_tch
into bi_kivah.dbo.l_emp_level       
from havik.dbo.br_cargo base