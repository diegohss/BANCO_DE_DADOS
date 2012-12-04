USE [havik]
GO

/****** Object:  Table [dbo].[bh_relatorios]    Script Date: 03/27/2012 10:29:49 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[bh_relatorios](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[modulo] [varchar](50) NULL,
	[tipo] [varchar](3) NULL,
	[dt_alteracao] [datetime] NOT NULL,
	[usuario] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


