USE [havik_teste]
GO

/****** Object:  Table [dbo].[bh_proj_financeiro]    Script Date: 04/24/2012 10:38:26 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[bh_proj_financeiro](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[id_projeto] [bigint] not null,
	[id_cliente] [bigint] NULL,
	[acao] [bigint] NULL,
	[faturar] [int] NULL,
	[email_fatura] [varchar](150) NULL,
	[particularidades] [varchar](4000) NULL,
	[base_faturamento] [money] NULL,
	[salario_final] [money] NULL,
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

ALTER TABLE [dbo].[bh_proj_financeiro]  WITH CHECK ADD FOREIGN KEY([id_projeto])
REFERENCES [dbo].[bc_projeto] ([id])
GO

ALTER TABLE [dbo].[bh_proj_financeiro]  WITH CHECK ADD FOREIGN KEY([id_impostos])
REFERENCES [dbo].[br_impostos] ([id])
GO

ALTER TABLE [dbo].[bh_proj_financeiro]  WITH CHECK ADD FOREIGN KEY([id_modo_pagamento])
REFERENCES [dbo].[br_modo_pagamento] ([id])
GO

ALTER TABLE [dbo].[bh_proj_financeiro]  WITH CHECK ADD FOREIGN KEY([acao])
REFERENCES [dbo].[br_acao] ([id])
GO


