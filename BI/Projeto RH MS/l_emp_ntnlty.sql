/*
l_emp_ntnlty
-- modelo de contrato
emp_pstn_sts_id	Cod Jornada Trabalho
emp_pstn_sts_desc	Descri��o Jornada Trabalho
emp_pstn_sts_desc_sch	Outro modo descri��o
emp_pstn_sts_desc_tch	Outro modo descri��o

*/
-- l_emp_ntnlty
-- drop table bi_kivah.dbo.l_emp_ntnlty  
select base.id emp_pstn_sts_id,
       left(base.nome,30) emp_pstn_sts_desc,
       '' emp_pstn_sts_desc_sch,
       '' emp_pstn_sts_desc_tch
into bi_kivah.dbo.l_emp_ntnlty       
from havik.dbo.br_paises base