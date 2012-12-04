CREATE TABLE rh.dim_candidato
(
	cod_candidato bigint NOT NULL primary key,
	nome_candidato varchar(300) NOT NULL,
	cidade varchar(50) NULL,
	estado varchar(50) NULL,
	idade int NULL,
	ult_empresa varchar(100) NULL,
	ult_salario money NULL,
	ult_cargo varchar(100) NULL,
	ult_area varchar(100) NULL,
	ult_subdivisao varchar(100) NULL,
	ult_segmento varchar(100) NULL
)


