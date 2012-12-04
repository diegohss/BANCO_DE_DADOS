/*
l_emp_sts
emp_sts_id	Cod Status Atual
emp_sts_desc	Descrição Status
emp_sts_desc_sch	Outro modo descrição
emp_sts_desc_tch	Outro modo descrição
*/
-- l_emp_sts
-- drop table bi_kivah.dbo.l_emp_sts
select base.id emp_title_id,
       left(base.descricao,30) emp_title_desc,
       '' emp_title_desc_sch,
       '' emp_title_desc_tch
into bi_kivah.dbo.l_emp_sts
from havik.dbo.br_ativo base
