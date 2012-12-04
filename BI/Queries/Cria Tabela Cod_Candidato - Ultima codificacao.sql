USE bi_kivah
GO

CREATE TABLE bi_kivah.dbo.dim_codi_candidato_ult(
	cod_candidato bigint foreign key references bi_kivah.dbo.dim_candidato (cod_candidato),
	cod_codificacao int NULL,
	area varchar(100) NULL,
	subdivisao varchar(100) NULL,
	segmento varchar(100) NULL
)



