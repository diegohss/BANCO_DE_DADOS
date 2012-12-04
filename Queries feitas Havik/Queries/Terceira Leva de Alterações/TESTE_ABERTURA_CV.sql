
insert into bc_cli_base_cvs
(
id_cliente,
nome_arquivo,
tipo_arquivo,
idioma,
caminho,
cv,
dados,
dt_criacao,
usuario_criacao
)
select top 1 base.id_cliente,
base.id_cliente,
'application/vnd.ms-word',
1,
null,
base.cv,
cast(base.cv as varbinary(max)),
GETDATE(),
35

from bc_cli_cvs base

