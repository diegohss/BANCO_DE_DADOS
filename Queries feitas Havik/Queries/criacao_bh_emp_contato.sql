create table bh_emp_contato
(
id bigint identity(1,1) not null primary key,
id_empresa bigint not null foreign key references bc_empresa_unq(id),
id_cliente bigint not null foreign key references bc_cliente(id),
nome varchar(400) null,
cargo bigint null,
usuario_alteracao smallint not null 
)
