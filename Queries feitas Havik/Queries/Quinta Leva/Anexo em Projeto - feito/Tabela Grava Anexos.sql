USE [havik]
GO

/****** Object:  Table [dbo].[bc_cli_base_cvs]    Script Date: 02/13/2012 16:02:56 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[bh_proj_anexos](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[id_projeto] [bigint] NOT NULL,
	[nome_arquivo] [varchar](150) NULL,
	[tipo_arquivo] [varchar](50) NULL,
	[tipo_anexo] [int] NULL,
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

ALTER TABLE [dbo].[bh_proj_anexos]  WITH CHECK ADD FOREIGN KEY([id_projeto])
REFERENCES [dbo].[bc_projeto] ([id])
GO

ALTER TABLE [dbo].[bh_proj_anexos]  WITH CHECK ADD FOREIGN KEY([usuario_criacao])
REFERENCES [dbo].[bc_usuario] ([id])
GO

ALTER TABLE [dbo].[bh_proj_anexos]  WITH CHECK ADD FOREIGN KEY([tipo_anexo])
REFERENCES [dbo].[br_proj_tp_anexo] ([id])
GO

