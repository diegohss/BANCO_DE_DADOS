USE havik
GO

/****** Object:  Table dbo.bc_cli_consultor    Script Date: 10/04/2011 18:01:39 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE bc_cli_consultor_c(
	id bigint IDENTITY(1,1) NOT NULL,
	id_cliente bigint NOT NULL,
	c_senso int NULL,
	c_eloquencia int NULL,
	c_objetivo int NULL,
	c_energia int NULL,
	c_ouvinte int NULL,
	c_mkt int NULL,
	c_credibilidade int NULL,
	c_estruturado int NULL,
	usuario_alteracao int NOT NULL,
	dt_alteracao datetime NOT NULL,
PRIMARY KEY CLUSTERED 
(
	id ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE bc_cli_consultor  WITH CHECK ADD FOREIGN KEY(id_cliente)
REFERENCES bc_cliente(id)
GO


