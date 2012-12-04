/*
l_emp_pstn_sts
-- modelo de contrato
emp_pstn_sts_id	Cod Jornada Trabalho
emp_pstn_sts_desc	Descrição Jornada Trabalho
emp_pstn_sts_desc_sch	Outro modo descrição
emp_pstn_sts_desc_tch	Outro modo descrição

*/
-- l_emp_pstn_sts
-- drop table bi_kivah.dbo.l_emp_pstn_sts 
select base.id emp_pstn_sts_id,
       left(base.descricao,30) emp_pstn_sts_desc,
       '' emp_pstn_sts_desc_sch,
       '' emp_pstn_sts_desc_tch
into bi_kivah.dbo.l_emp_pstn_sts       
from havik.dbo.br_tp_contratacao base