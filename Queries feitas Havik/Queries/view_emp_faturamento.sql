create view vw_emp_faturamento
as
select top 100 id, descricao
from br_emp_faturamento
order by descricao