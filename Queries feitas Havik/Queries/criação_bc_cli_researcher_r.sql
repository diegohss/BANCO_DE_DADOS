USE havik
GO

/****** Object:  Table dbo.bc_cli_researcher    Script Date: 10/04/2011 18:51:33 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE bc_cli_researcher_r(
	id bigint IDENTITY(1,1) NOT NULL,
	id_cliente bigint NOT NULL,
	salario money NULL,
	movimento bigint NULL,
	mudanca bit NULL,
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

ALTER TABLE dbo.bc_cli_researcher  WITH CHECK ADD FOREIGN KEY(movimento)
REFERENCES dbo.br_cli_drive (id)
GO


