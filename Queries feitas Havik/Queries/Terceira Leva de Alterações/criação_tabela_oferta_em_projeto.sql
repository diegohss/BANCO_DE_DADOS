USE [havik]
GO

/****** Object:  Table [dbo].[bc_proj_oferta]    Script Date: 12/02/2011 14:34:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[bc_proj_oferta](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[id_projeto] [bigint] NOT NULL,
	[tp_contrato] [bigint] NULL,
	[salario_mensal] [money] NULL,
	[bonus] [money] NULL,
	[total_cash] [money] NULL,
	[dt_criacao] [datetime] NOT NULL,
	[usuario_criacao] [int] NOT NULL
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[bc_proj_oferta]  WITH CHECK ADD FOREIGN KEY([id_projeto])
REFERENCES [dbo].[bc_projeto] ([id])
GO

ALTER TABLE [dbo].[bc_proj_oferta]  WITH CHECK ADD FOREIGN KEY([tp_contrato])
REFERENCES [dbo].[br_tp_contratacao] ([id])
GO

ALTER TABLE [dbo].[bc_proj_oferta]  WITH CHECK ADD FOREIGN KEY([usuario_criacao])
REFERENCES [dbo].[bc_usuario] ([id])
GO

