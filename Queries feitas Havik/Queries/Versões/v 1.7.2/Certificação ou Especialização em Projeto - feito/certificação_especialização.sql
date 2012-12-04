USE [havik]
GO

/****** Object:  Table [dbo].[bh_proj_certificacao]    Script Date: 03/27/2012 14:40:03 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[bh_proj_certificacao](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[id_projeto] [bigint] NOT NULL,
	[descricao] [varchar](40) NOT NULL,
	[dt_criacao] [datetime] NOT NULL,
	[usuario_criacao] [int] NOT NULL,
	[exibir] [smallint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[bh_proj_certificacao]  WITH CHECK ADD FOREIGN KEY([id_projeto])
REFERENCES [dbo].[bc_projeto] ([id])
GO


