USE [havik]
GO

/****** Object:  Table [dbo].[bh_proj_beneficios]    Script Date: 12/02/2011 15:24:07 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[bh_proj_perfil](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[id_projeto] [bigint] NOT NULL,
	[perfil] [bigint] NULL,
	[dt_criacao] [datetime] NOT NULL,
	[usuario_criacao] [int] NOT NULL
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[bh_proj_perfil]  WITH CHECK ADD FOREIGN KEY([perfil])
REFERENCES [dbo].[br_proj_perfil] ([id])
GO

ALTER TABLE [dbo].[bh_proj_perfil]  WITH CHECK ADD FOREIGN KEY([id_projeto])
REFERENCES [dbo].[bc_projeto] ([id])
GO


