CREATE TABLE rh.dim_codi_candidato(
	cod_candidato bigint null references rh.dim_candidato(cod_candidato),
	cod_codificacao int NULL,
	area varchar(100) NULL,
	subdivisao varchar(100) NULL,
	segmento varchar(100) NULL
);
CREATE TABLE rh.dim_codi_candidato_ult
(
	cod_candidato bigint NULL references rh.dim_candidato(cod_candidato),
	cod_codificacao int NULL,
	area varchar(100) NULL,
	subdivisao varchar(100) NULL,
	segmento varchar(100) NULL
);