USE havik
GO

/****** Object:  Table dbo.bc_cli_consultor    Script Date: 10/04/2011 17:56:47 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE bc_cli_consultor_a(
	id bigint IDENTITY(1,1) NOT NULL,
	id_cliente bigint NOT NULL,
	a_senso int NULL,
	a_saudacao int NULL,
	a_impressao int NULL,
	a_levantou int NULL,
	a_profissionalismo int NULL,
	usuario_alteracao int NOT NULL,
	dt_alteracao datetime NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE dbo.bc_cli_consultor  WITH CHECK ADD FOREIGN KEY(id_cliente)
REFERENCES dbo.bc_cliente (id)
GO


