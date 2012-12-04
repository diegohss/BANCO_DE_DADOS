USE [havik_teste]
GO

/****** Object:  Table [dbo].[bh_fin_status]    Script Date: 04/24/2012 11:10:42 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[bh_fin_status](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[id_projeto] [bigint] NOT NULL,
	[id_acao] [bigint] not null,
	[id_status] [bigint] NOT NULL,
	[id_nota] [bigint] NULL,
	[usuario] [int] NOT NULL,
	[dt_alteracao] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[bh_fin_status]  WITH CHECK ADD FOREIGN KEY([id_nota])
REFERENCES [dbo].[br_fin_nota] ([id])
GO

ALTER TABLE [dbo].[bh_fin_status]  WITH CHECK ADD FOREIGN KEY([id_projeto])
REFERENCES [dbo].[bc_projeto] ([id])
GO

ALTER TABLE [dbo].[bh_fin_status]  WITH CHECK ADD FOREIGN KEY([id_acao])
REFERENCES [dbo].[bh_proj_financeiro] ([id])
GO

ALTER TABLE [dbo].[bh_fin_status]  WITH CHECK ADD FOREIGN KEY([id_status])
REFERENCES [dbo].[br_fin_status] ([id])
GO


