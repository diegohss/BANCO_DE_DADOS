USE [havik_teste]
GO

/****** Object:  Table [dbo].[bh_financeiro]    Script Date: 04/24/2012 11:33:06 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[bh_financeiro](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[id_acao] [bigint] NOT NULL,
	[tp_mudanca] [varchar](30) NOT NULL,
	[dt_alteracao] [datetime] NOT NULL,
	[usuario_alteracao] [int] NOT NULL,
	[tabela_alteracao] [varchar](200) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[bh_financeiro]  WITH CHECK ADD FOREIGN KEY([id_acao])
REFERENCES [dbo].[bh_proj_financeiro] ([id])
GO


