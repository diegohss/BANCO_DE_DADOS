use havik

go

alter table bh_cli_status
add id_motivo bigint null foreign key references br_cli_motivos(id) 