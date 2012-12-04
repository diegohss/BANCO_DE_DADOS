USE [havik]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__bh_proj_co__id_co__4F12BBB9]') AND parent_object_id = OBJECT_ID(N'[dbo].[bh_proj_concorrentes]'))
ALTER TABLE [dbo].[bh_proj_concorrentes] DROP CONSTRAINT [FK__bh_proj_co__id_co__4F12BBB9]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__bh_proj_co__id_em__4E1E9780]') AND parent_object_id = OBJECT_ID(N'[dbo].[bh_proj_concorrentes]'))
ALTER TABLE [dbo].[bh_proj_concorrentes] DROP CONSTRAINT [FK__bh_proj_co__id_em__4E1E9780]
GO

USE [havik]
GO

/****** Object:  Table [dbo].[bh_proj_concorrentes]    Script Date: 09/20/2011 19:27:47 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[bh_proj_concorrentes]') AND type in (N'U'))
DROP TABLE [dbo].[bh_proj_concorrentes]
GO

USE [havik]
GO

/****** Object:  Table [dbo].[bh_proj_concorrentes]    Script Date: 09/20/2011 19:27:47 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[bh_proj_concorrentes](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[id_empresa] [bigint] NOT NULL,
	[id_concorrente] [bigint] NOT NULL,
	[dt_alteracao] [datetime] NOT NULL,
	[usuario_alteracao] [smallint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[bh_proj_concorrentes]  WITH CHECK ADD FOREIGN KEY([id_concorrente])
REFERENCES [dbo].[bc_empresa_unq] ([id])
GO

ALTER TABLE [dbo].[bh_proj_concorrentes]  WITH CHECK ADD FOREIGN KEY([id_empresa])
REFERENCES [dbo].[bc_empresa_unq] ([id])
GO


