alter table bh_proj_graduacao
add exibir smallint null

go

alter table bh_proj_idiomas
add exibir smallint null

go

alter table bh_proj_fin_despesas
add exibir smallint null

go

update bh_proj_graduacao
set exibir='1'
go
update bh_proj_idiomas
set exibir='1'
go
update bh_proj_fin_despesas
set exibir='1'
go

