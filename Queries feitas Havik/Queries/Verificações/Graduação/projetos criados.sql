use havik
select COUNT(*)
from bc_projeto
where convert(char(10),dt_ini,23)>='2011-12-26'

