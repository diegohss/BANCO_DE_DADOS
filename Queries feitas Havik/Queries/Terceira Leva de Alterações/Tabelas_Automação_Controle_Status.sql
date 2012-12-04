create table br_cli_tp_retorno
(
id int not null identity(1,1) primary key, 
descricao varchar(30) not null,
dt_criacao datetime not null,
usuario_criacao int not null foreign key references bc_usuario(id)
)

go

create table br_cli_tp_cicatriz
(
id int not null identity(1,1) primary key,
descricao varchar(30) not null,
hexa varchar(12) not null,
usuario_criacao int not null foreign key references bc_usuario(id),
dt_criacao datetime not null
)

go

create table bh_cli_fups
(
id bigint not null identity(1,1) primary key, 
id_status bigint null foreign key references br_cli_status(id),
id_substatus bigint null foreign key references br_cli_substatus(id),
tp_retorno int null foreign key references br_cli_tp_retorno(id),
tp_cicatriz int null foreign key references br_cli_tp_cicatriz(id),
entrevistador tinyint null,
follow tinyint null,
qtd_dias int null,
ativo tinyint not null,
dt_criacao datetime not null,
usuario_criacao int not null foreign key references bc_usuario(id)
)

go

create table bh_cli_cicatriz
(
id bigint not null identity(1,1) primary key,
id_cicatriz int not null foreign key references br_cli_tp_cicatriz(id),
id_cliente bigint not null foreign key references bc_cliente(id),
ativo tinyint not null,
dt_criacao datetime not null,
usuario_criacao int not null foreign key references bc_usuario(id)
)

go
/*
create table bh_emp_offlimits
(
id bigint not null identity(1,1) primary key,
id_empresa bigint not null foreign key references bc_empresa_unq(id),
 

)*/