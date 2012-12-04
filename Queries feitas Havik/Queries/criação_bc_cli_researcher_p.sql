USE havik
GO

/****** Object:  Table dbo.bc_cli_researcher    Script Date: 10/04/2011 18:48:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE bc_cli_researcher_p(
	id bigint IDENTITY(1,1) NOT NULL,
	id_cliente bigint NOT NULL,
	p_inteligencia int NULL,
	p_maturidade int NULL,
	p_visao int NULL,
	p_confianca int NULL,
	p_honestidade int NULL,
	p_punch int NULL,
	p_carisma int NULL,
	usuario_alteracao int NOT NULL,
	dt_alteracao datetime NOT NULL,
PRIMARY KEY CLUSTERED 
(
	id ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE dbo.bc_cli_researcher  WITH CHECK ADD FOREIGN KEY(id_cliente)
REFERENCES dbo.bc_cliente (id)
GO


