USE [havik]
GO

/****** Object:  Table [dbo].[br_subdivisao]    Script Date: 08/10/2011 21:30:22 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[br_subdivisao]') AND type in (N'U'))
DROP TABLE [dbo].[br_subdivisao]
GO

USE [havik]
GO

/****** Object:  Table [dbo].[br_subdivisao]    Script Date: 08/10/2011 21:30:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[br_subdivisao](
	[id] bigint IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[descricao] varchar(100) NULL,
	[usuario_criacao] smallint NOT NULL,
	[dt_criacao] datetime NULL

) ON [PRIMARY]

GO


