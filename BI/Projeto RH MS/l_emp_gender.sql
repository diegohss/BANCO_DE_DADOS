/*
l_emp_gender
emp_gender_id	Id Sexo
emp_gender_desc	Descrição Sexo
emp_gender_desc_sch	Outro modo descrição
emp_gender_desc_tch	Outro modo descrição
*/
-- l_emp_gender
-- drop table bi_kivah.dbo.l_emp_gender  
select base.id emp_gender_id,
       left(base.descricao,30) emp_gender_desc,
       '' emp_gender_desc_sch,
       '' emp_gender_desc_tch
into bi_kivah.dbo.l_emp_gender      
from havik.dbo.br_sexo base