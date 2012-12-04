use havik
go

delete from bh_cli_telefone
where id_cliente in (select id_cliente from tmp_dup_telefone_cli)
and
id not in (select id from tmp_dup_telefone)