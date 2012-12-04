/*
l_emp_mrtl_sts
-- modelo de contrato
emp_mrtl_sts_id	Id_Estado_Civil
emp_mrtl_sts_desc	Descrição Estado Civil
emp_mrtl_sts_desc_sch	Outro modo descrição
emp_mrtl_sts_desc_tch	Outro modo descrição
*/
-- l_emp_mrtl_sts
-- drop table bi_kivah.dbo.l_emp_mrtl_sts
select base.id emp_mrtl_sts_id,
       left(base.descricao,30) emp_mrtl_sts_desc,
       '' emp_mrtl_sts_desc_sch,
       '' emp_mrtl_sts_desc_tch
into bi_kivah.dbo.l_emp_mrtl_sts  
from havik.dbo.br_estado_civil base