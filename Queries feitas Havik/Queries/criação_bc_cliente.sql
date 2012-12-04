CREATE TABLE bc_cliente
(
	id bigint IDENTITY(1,1) NOT NULL,
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
	cidade nvarchar(6) null foreign key references br_cidade(muncod),
	estado nvarchar(2) null foreign key references br_estados(ufcod),
	pais smallint null foreign key references br_paises(id)
)
