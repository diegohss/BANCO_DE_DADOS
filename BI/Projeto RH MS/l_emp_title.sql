/*
l_emp_title
emp_title_id	Cod Cargo
emp_title_desc	Descri��o Cargo
emp_title_desc_sch	Outro modo descri��o
emp_title_desc_tch	Outro modo descri��o

*/
-- l_emp_title
-- drop table bi_kivah.dbo.l_emp_title
select base.id emp_title_id,
       left(base.descricao,30) emp_title_desc,
       '' emp_title_desc_sch,
       '' emp_title_desc_tch
into bi_kivah.dbo.l_emp_title
from havik.dbo.br_cargo base

