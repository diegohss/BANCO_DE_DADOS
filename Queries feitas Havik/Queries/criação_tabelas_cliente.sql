CREATE TABLE bc_cliente
(
	id bigint IDENTITY(1,1) primary key NOT NULL,
	nome varchar(300) NULL,
	cpf varchar(11) null,
	dt_nascimento date null,
	estado_civil bigint not null foreign key references br_estado_civil(id),
	sexo tinyint not null foreign key references br_sexo(id),
	endereco varchar(500) NULL,
	numero varchar(20) NULL,
	complemento varchar(60) NULL,
	cep varchar(8) NULL,
	bairro varchar(150) NULL,
	cidade nvarchar(6) null foreign key references br_cidades(muncod),
	estado nvarchar(2) null foreign key references br_estados(ufcod),
	pais smallint null foreign key references br_paises(id),
	dt_alteracao datetime NOT NULL,
	usuario_alteracao smallint NOT NULL
)

create table bh_cli_email
(
id bigint IDENTITY(1,1) primary key NOT NULL,
id_cliente bigint not null foreign key references bc_cliente(id),
descricao varchar(100) not null,
dt_alteracao datetime NOT NULL,
usuario_alteracao smallint NOT NULL
)

create table bh_cli_telefone
(
id bigint IDENTITY(1,1) primary key NOT NULL,
id_cliente bigint not null foreign key references bc_cliente(id),
cod_pais varchar(8) null,
ddd int null,
telefone varchar(15) null,
dt_alteracao datetime NOT NULL,
usuario_alteracao smallint NOT NULL
)