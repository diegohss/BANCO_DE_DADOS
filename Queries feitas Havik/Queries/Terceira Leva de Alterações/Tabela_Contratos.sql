USE [havik]
GO

/****** Object:  Table [dbo].[bc_cli_base_cvs]    Script Date: 12/13/2011 10:59:24 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[bc_emp_contrato](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[id_empresa] [bigint] NOT NULL,
	[nome_arquivo] [varchar](50) NULL,
	[tipo_arquivo] [varchar](50) NULL,
	[idioma] [tinyint] NULL,
	[caminho] [varchar](100) NULL,
	[contrato] [nvarchar](max) NULL,
	[dados] [varbinary](max) NULL,
	[dt_criacao] [datetime] NOT NULL,
	[usuario_criacao] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[bc_emp_contrato]  WITH CHECK ADD FOREIGN KEY([id_empresa])
REFERENCES [dbo].[bc_empresa_unq] ([id])
GO

ALTER TABLE [dbo].[bc_emp_contrato]  WITH CHECK ADD FOREIGN KEY([usuario_criacao])
REFERENCES [dbo].[bc_usuario] ([id])
GO


