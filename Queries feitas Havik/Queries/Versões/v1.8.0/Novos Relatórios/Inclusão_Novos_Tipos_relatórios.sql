use havik_teste
go
INSERT INTO br_relat_tipos
           ([descricao]
           ,[obs]
           ,[dt_criacao]
           ,[usuario_criacao]
           ,nome_procedure
           )
     VALUES
           ('Relat�rio 1','Resumo de Entrevistas feitas por quem registrou a nota','2012-05-28',1,'sp_relat_ent_feita'),
           ('Relat�rio 2','Resumo de Entrevistas feitas por quem registrou a nota','2012-05-28',1,'sp_relat_ent_marcada'),
           ('Relat�rio 3','Resumo de Entrevistas feitas por quem registrou a nota','2012-05-28',1,'sp_relat_cdd_ok'),
           ('Relat�rio 4','Resumo de Entrevistas feitas por quem registrou a nota','2012-05-28',1,'sp_relat_cdd_ok_proj')
GO


