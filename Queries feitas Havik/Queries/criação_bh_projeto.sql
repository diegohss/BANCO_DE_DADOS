USE [havik]
GO

/****** Object:  Table [dbo].[bh_projeto]    Script Date: 09/20/2011 19:33:00 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[bh_projeto](
	[id] [decimal](10, 0) IDENTITY(1,1) NOT NULL,
	[id_projeto] [varchar](10) NOT NULL,
	[tp_mudanca] [varchar](50) NULL,
	[dt_alteracao] [datetime] NOT NULL,
	[usuario_alteracao] [bigint] NULL,
	[tabela_alteracao] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


