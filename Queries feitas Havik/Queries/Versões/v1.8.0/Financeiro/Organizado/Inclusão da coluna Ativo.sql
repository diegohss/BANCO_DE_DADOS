-- Criar novo campo na tabela bh_proj_financeiro para A��es ativas ou n�o

use havik
go
alter table bh_proj_financeiro
add ativo int null

use havik
go
update bh_proj_financeiro
set ativo=1