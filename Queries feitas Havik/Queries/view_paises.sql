create view vw_emp_paises

as

select top 1000 id,nome
from br_paises
order by nome 

