create view vw_emp_segmento
as
select top 50 id, descricao
from br_segmento
order by descricao;

create view vw_proj_segmento
as
select top 50 id, descricao
from br_segmento
order by descricao;

create view vw_cli_segmento
as
select top 50 id, descricao
from br_segmento
order by descricao;