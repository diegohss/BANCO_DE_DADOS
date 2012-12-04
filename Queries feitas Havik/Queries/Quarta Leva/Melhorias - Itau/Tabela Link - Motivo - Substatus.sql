USE [havik]
GO

/****** Object:  Table [dbo].[bl_cli_status_substatus]    Script Date: 02/10/2012 11:23:56 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[bl_cli_substatus_motivo](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[id_substatus] [bigint] NOT NULL,
	[id_motivo] [bigint] NOT NULL,
	[usuario_criacao] [smallint] NOT NULL,
	[dt_criacao] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[bl_cli_substatus_motivo]  WITH CHECK ADD FOREIGN KEY([id_substatus])
REFERENCES [dbo].[br_cli_substatus] ([id])
GO

ALTER TABLE [dbo].[bl_cli_substatus_motivo]  WITH CHECK ADD FOREIGN KEY([id_motivo])
REFERENCES [dbo].[br_cli_motivos] ([id])
GO


