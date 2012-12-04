/*Criação da tabela de empresas
As tabelas de referencia devem ser criadas primeiro seguidas das ta

*/

-- Ultima tabela a ser criada
create table bc_empresa_unq
(
id bigint identity(1,1) not null primary key,
cnpj varchar(14) null unique key,
razao_social varchar(100) not null,
nome varchar(100) null,	
segmento varchar(50) not null,
endereco varchar (200) null,
numero smallint null,
complem varchar(60) null,
bairro varchar(100) null,
cidade smallint(6) null,
estado smallint (2) null,
pais smallint(2) null,
offlimits varchar(1) null
);

create table bc_empresa_mult
(
id bigint identity(1,1) not null primary key,
tp_alteracao bigint foreign key references tr_tp_alteracao_empresa (id),
descricao varchar(100),
dt_log datetime
);

create table br_tipo_tel_empresa
(
id bigint identity(1,1) not null primary key,
descricao varchar(100),
usuario_criacao smallint not null,
dt_criacao datetime
);

create table br_tipo_offlimits_empresa
(



);

create table bc_empresa_tels
(
id bigint identity(1,1) not null primary key,
cod_pais smallint,
ddd smallint,
telefone smallint,
tipo_tel bigint foreign key br_tipo_tel_empresa(id),
descricao varchar(100),
dt_log datetime
);

create table br_tp_alteracao_empresa
(
id bigint identity(1,1) not null primary key,
descricao varchar(150),
usuario_criacao smallint not null,
dt_criacao datetime
);


create table bh_empresa
(
id bigint identity(1,1) not null primary key,
id_empresa bigint not null foreign key references bc_empresa (id),
tp_mudanca int not null,
dt_alteracao datetime not null,
usuario_alteracao varchar(4) not null 
);

create table br_emp_offlimits
(
id bigint identity(1,1) not null primary key,
descricao varchar(100),
usuario_criacao smallint not null,
dt_criacao datetime
);



