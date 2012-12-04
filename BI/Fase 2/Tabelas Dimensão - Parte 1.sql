create table rh.dim_empresa
(
cod_empresa bigint primary key not null,
nome_empresa varchar(100) not null,
segmento varchar(100) null,
cidade varchar(50) null,
estado varchar(50) null,
offlimits bit null,
grupo varchar(100) null,
cliente_havik bit not null
);
create table rh.dim_projeto
(
cod_projeto bigint primary key not null,
nome_projeto varchar(200) not null,
empresa varchar(100) not null,
cidade varchar(50) null,
estado varchar(50) null,
resp_captacao varchar(50) null,
resp_entrega varchar(50) null,
resp_colaborador varchar(50) null,
equipe_entrega varchar(50) null,
dificuldade varchar(50) null,
area varchar(100) null,
subdivisao varchar(100) null,
segmento varchar(100) null,
tipo_carteira varchar(50) null
);
create table rh.dim_financeiro
(
cod_financeiro bigint primary key not null,
acao varchar(50) not null,
nome_projeto varchar(200) not null,
empresa varchar(100) not null,
resp_captacao varchar(50) null,
resp_entrega varchar(50) null,
resp_colaborador varchar(50) null,
equipe_entrega varchar(50) null,
impostos varchar(100) null,
fee money null,
produto varchar(50) null
);
create table rh.dim_status_candidato
(
cod_status int primary key not null,
status varchar(100) not null,
substatus varchar(100) not null
);
create table rh.dim_status_projeto
(
cod_status int primary key not null,
status varchar(100) not null,
substatus varchar(100) not null
);
create table rh.dim_status_empresa
(
cod_status int primary key not null,
status varchar(100) not null,
substatus varchar(100) not null
);
create table rh.dim_status_financeiro
(
cod_status int primary key not null,
status varchar(100) not null,
substatus varchar(100) not null
);
create table rh.dim_produto
(
cod_produto int primary key not null,
produto varchar(50) not null
);
create table rh.dim_cargo
(
cod_cargo int primary key not null,
cargo varchar(100) not null
);
create table rh.dim_codificacao
(
cod_codificacao int primary key not null,
area varchar(100) null,
subdivisao varchar(100) null,
segmento varchar(100) null
);
create table rh.dim_usuario
(
cod_usuario int primary key not null,
nome_usuario varchar(100) not null,
equipe varchar(100) null,
cargo varchar(100) not null,
und_negocio varchar(100) null,
ativo bit not null
);