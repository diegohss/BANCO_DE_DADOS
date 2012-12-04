use havik
go

insert into bh_cli_codifica
(
id_cliente,
id_area,
id_subdivisao,
id_segmento,
dt_alteracao,
usuario_alteracao,
exibir
)
select 
base.id_cliente,
base.id_area,
base.id_subdivisao,
base.id_segmento,
base.dt_alteracao,
base.usuario_alteracao,
1

from bh_cli_profissional base

group by
base.id_cliente,
base.id_area,
base.id_subdivisao,
base.id_segmento,
base.dt_alteracao,
base.usuario_alteracao

