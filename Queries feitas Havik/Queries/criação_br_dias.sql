USE [havik]
GO

/****** Object:  Table [dbo].[br_area]    Script Date: 08/10/2011 14:25:27 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[br_dias]') AND type in (N'U'))
DROP TABLE [dbo].[br_dias]
GO

USE [havik]
GO

/****** Object:  Table [dbo].[br_dias]    Script Date: 08/10/2011 14:25:27 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[br_dias](
	id bigint identity(1,1) not null primary key,
	descricao varchar(100),
	usuario_criacao smallint not null,
	dt_criacao datetime
) ON [PRIMARY]

GO


