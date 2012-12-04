create view vw_proj_mapeamento
as
select top 100 id,campo

from br_mapeamento_rel
where modulo='projeto'
order by 2