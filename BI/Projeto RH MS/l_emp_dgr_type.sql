/*
l_emp_dgr_type
emp_dgr_type_id	Cod Tipo Gradua��o
emp_dgr_type_desc	Descri��o Tipo Gradua��o
emp_dgr_type_desc_sch	Outro modo descri��o
emp_dgr_type_desc_tch	Outro modo descri��o
*/
-- l_emp_dgr_type
-- drop table bi_kivah.dbo.l_emp_dgr_type 
select base.id emp_dgr_type_id,
       left(base.descricao,30) emp_dgr_type_desc,
       '' emp_dgr_type_desc_sch,
       '' emp_dgr_type_desc_tch
into bi_kivah.dbo.l_emp_dgr_type              
from havik.dbo.br_graduacao base
