use havik_teste

go

create trigger tg_proj_financeiro_status
on dbo.bh_proj_financeiro
for insert
as 
if update(faturar)
begin
insert into bh_fin_status
(
id_projeto,
id_acao,
id_status,
usuario,
dt_alteracao
)
select
id_projeto,
id,
1,
usuario_alteracao,
dt_alteracao
from inserted
where faturar=1
end
