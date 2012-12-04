USE [havik]
GO

/****** Object:  Table [dbo].[br_cli_substatus]    Script Date: 02/10/2012 11:11:55 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[br_cli_motivos](
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


