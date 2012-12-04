USE [havik]
GO

/****** Object:  Table [dbo].[br_cli_cvs_idiomas]    Script Date: 02/13/2012 16:17:16 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[br_proj_tp_anexo](
	[id] [int] NOT NULL IDENTITY(1,1) PRIMARY KEY,
	[descricao] [varchar](50) NULL,
	[usuario_criacao] [int] NOT NULL,
	[dt_criacao] [datetime] NOT NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


