/*
l_emp_region
emp_region_id	Cod Regi�o
emp_region_desc	Descri��o da Regi�o
emp_region_desc_sch	Outro modo descri��o
emp_region_desc_tch	Outro modo descri��o
*/
-- l_emp_region
-- drop table bi_kivah.dbo.l_emp_region       
select base.UFCOD emp_region_id,
       cast(left(base.UFNOME,30) as CHAR(30)) emp_region_desc,
       '' emp_region_desc_sch,
       '' emp_region_desc_tch
into bi_kivah.dbo.l_emp_region       
from havik.dbo.br_estados base