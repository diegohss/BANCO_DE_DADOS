USE [havik]
GO

/****** Object:  Table [dbo].[br_paises]    Script Date: 09/19/2011 12:19:57 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[br_paises]') AND type in (N'U'))
DROP TABLE [dbo].[br_paises]
GO

USE [havik]
GO

/****** Object:  Table [dbo].[br_paises]    Script Date: 09/19/2011 12:19:58 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[br_paises](
	[iso] [char](2) NOT NULL,
	[iso3] [char](3) NOT NULL,
	[id] [smallint] NOT NULL primary key,
	[nome] [varchar](255) NOT NULL
)
GO

SET ANSI_PADDING OFF
GO


