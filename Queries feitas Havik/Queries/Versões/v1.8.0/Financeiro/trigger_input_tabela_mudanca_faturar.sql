use havik_teste

go

create trigger tg_proj_financeiro
on dbo.bh_proj_financeiro
for insert,update
as 
if update(faturar)
begin
insert into bh_proj_faturar
(
id_acao,
faturar,
usuario_alteracao,
dt_alteracao
)
select
acao,
faturar,
usuario_alteracao,
dt_alteracao
from inserted
where faturar is not null
end

