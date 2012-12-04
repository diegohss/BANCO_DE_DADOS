CREATE TABLE bc_empresa_filial
(
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[id_empresa] [bigint] not null foreign key references bc_empresa_unq (id), 
	[nome] [varchar](100) NULL,
	[endereco] [varchar](200) NULL,
	[numero] [smallint] NULL,
	[complemento] [varchar](60) NULL,
	[bairro] [varchar](100) NULL,
	[cidade] [smallint] NULL,
	[estado] [nvarchar](2) NULL,
	[pais] [char](2) NULL,
	[cep] [varchar](8) NULL,
	[site] [varchar] (100)
)
go