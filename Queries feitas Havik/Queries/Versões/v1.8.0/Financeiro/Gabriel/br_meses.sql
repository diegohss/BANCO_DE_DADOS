USE [havik_teste]
GO

/****** Object:  Table [dbo].[br_meses]    Script Date: 04/16/2012 16:13:38 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[br_meses](
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


