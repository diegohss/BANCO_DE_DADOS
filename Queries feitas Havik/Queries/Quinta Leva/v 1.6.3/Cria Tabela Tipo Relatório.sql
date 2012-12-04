use havik
go 
create table br_relat_tipos
(
id bigint identity(1,1) not null,
descricao varchar(100) not null,
obs varchar(4000) null,
dt_criacao datetime not null,
usuario_criacao int not null
)