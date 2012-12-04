alter table bh_cli_cursos
add exibir smallint null

go

alter table bh_cli_idiomas
add exibir smallint null

go

update bh_cli_cursos
set exibir='1'

go

update bh_cli_idiomas
set exibir='1'