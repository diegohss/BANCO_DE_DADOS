create view vw_emp_offlimits
as
select top 10 id, descricao
from br_emp_offlimits
order by descricao;

