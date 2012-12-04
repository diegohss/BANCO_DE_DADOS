create table bc_cli_cvs
(
id bigint not null identity(1,1) primary key,
id_cliente bigint not null foreign key references bc_cliente(id),
idioma varchar (50) null,
caminho varchar(100) null,
cv nvarchar(max) null,
dt_alteracao datetime not null,
usuario_criacao int not null
)




