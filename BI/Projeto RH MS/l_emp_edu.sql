/*
l_emp_edu
emp_edu_id	Cod Escolaridade
emp_edu_desc	Descri��o Escolaridade
emp_edu_desc_sch	Outro modo descri��o
emp_edu_desc_tch	Outro modo descri��o
*/
-- l_emp_edu
-- drop table bi_kivah.dbo.l_emp_edu
select base.id emp_edu_id,
       cast(left(base.descricao,30) as CHAR(30)) emp_edu_desc,
       '' emp_edu_desc_sch,
       '' emp_edu_desc_tch
into bi_kivah.dbo.l_emp_edu       
from havik.dbo.br_escolaridade base