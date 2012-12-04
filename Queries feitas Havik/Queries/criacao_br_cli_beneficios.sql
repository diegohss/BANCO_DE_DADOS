USE [havik]
GO

/****** Object:  Table [dbo].[br_cli_beneficios]    Script Date: 09/27/2011 10:57:27 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[br_cli_beneficios]') AND type in (N'U'))
DROP TABLE [dbo].[br_cli_beneficios]
GO

USE [havik]
GO

/****** Object:  Table [dbo].[br_proj_beneficios]    Script Date: 09/27/2011 10:57:27 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[br_cli_beneficios](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[descricao] [varchar](100) NULL,
	[usuario_criacao] [smallint] NOT NULL,
	[dt_criacao] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


