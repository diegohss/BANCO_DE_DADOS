USE [havik_teste]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__bh_proj_f__id_cl__38102627]') AND parent_object_id = OBJECT_ID(N'[dbo].[bh_proj_financeiro]'))
ALTER TABLE [dbo].[bh_proj_financeiro] DROP CONSTRAINT [FK__bh_proj_f__id_cl__38102627]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__bh_proj_f__id_im__39F86E99]') AND parent_object_id = OBJECT_ID(N'[dbo].[bh_proj_financeiro]'))
ALTER TABLE [dbo].[bh_proj_financeiro] DROP CONSTRAINT [FK__bh_proj_f__id_im__39F86E99]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__bh_proj_f__id_mo__3AEC92D2]') AND parent_object_id = OBJECT_ID(N'[dbo].[bh_proj_financeiro]'))
ALTER TABLE [dbo].[bh_proj_financeiro] DROP CONSTRAINT [FK__bh_proj_f__id_mo__3AEC92D2]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__bh_proj_f__id_pr__39044A60]') AND parent_object_id = OBJECT_ID(N'[dbo].[bh_proj_financeiro]'))
ALTER TABLE [dbo].[bh_proj_financeiro] DROP CONSTRAINT [FK__bh_proj_f__id_pr__39044A60]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__bh_proj_fi__acao__3BE0B70B]') AND parent_object_id = OBJECT_ID(N'[dbo].[bh_proj_financeiro]'))
ALTER TABLE [dbo].[bh_proj_financeiro] DROP CONSTRAINT [FK__bh_proj_fi__acao__3BE0B70B]
GO

USE [havik_teste]
GO

/****** Object:  Table [dbo].[bh_proj_financeiro]    Script Date: 04/24/2012 17:08:00 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[bh_proj_financeiro]') AND type in (N'U'))
DROP TABLE [dbo].[bh_proj_financeiro]
GO

USE [havik_teste]
GO

/****** Object:  Table [dbo].[bh_proj_financeiro]    Script Date: 04/24/2012 17:08:00 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[bh_proj_financeiro](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[id_projeto] [bigint] NOT NULL,
	[id_cliente] [bigint] NULL,
	[acao] [bigint] NULL,
	[faturar] [int] NULL,
	[email_fatura] [varchar](150) NULL,
	[particularidades] [varchar](4000) NULL,
	[base_faturamento] [money] NULL,
	[salario_final] [money] NULL,
	[valor_nota] [money] null,
	[vencimento] [datetime] NULL,
	[fee] [money] NULL,
	[id_impostos] [bigint] NULL,
	[id_modo_pagamento] [bigint] NULL,
	[usuario_criacao] [int] NOT NULL,
	[dt_criacao] [datetime] NOT NULL,
	[usuario_alteracao] [int] NOT NULL,
	[dt_alteracao] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[bh_proj_financeiro]  WITH CHECK ADD FOREIGN KEY([id_cliente])
REFERENCES [dbo].[bc_cliente] ([id])
GO

ALTER TABLE [dbo].[bh_proj_financeiro]  WITH CHECK ADD FOREIGN KEY([id_impostos])
REFERENCES [dbo].[br_impostos] ([id])
GO

ALTER TABLE [dbo].[bh_proj_financeiro]  WITH CHECK ADD FOREIGN KEY([id_modo_pagamento])
REFERENCES [dbo].[br_modo_pagamento] ([id])
GO

ALTER TABLE [dbo].[bh_proj_financeiro]  WITH CHECK ADD FOREIGN KEY([id_projeto])
REFERENCES [dbo].[bc_projeto] ([id])
GO

ALTER TABLE [dbo].[bh_proj_financeiro]  WITH CHECK ADD FOREIGN KEY([acao])
REFERENCES [dbo].[br_acao] ([id])
GO


