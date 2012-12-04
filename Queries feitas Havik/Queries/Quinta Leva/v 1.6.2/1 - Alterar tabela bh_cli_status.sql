use havik_teste
go
alter table bh_cli_status
add indicado int null foreign key references bc_usuario(id)