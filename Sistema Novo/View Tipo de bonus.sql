use havik
go

create view vw_proj_tp_bonus
as
select top 100 id,descricao

from br_proj_tp_bonus

order by descricao