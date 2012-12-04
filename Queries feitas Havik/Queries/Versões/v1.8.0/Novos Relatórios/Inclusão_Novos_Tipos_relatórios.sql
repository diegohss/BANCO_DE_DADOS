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
           ('Relatório 1','Resumo de Entrevistas feitas por quem registrou a nota','2012-05-28',1,'sp_relat_ent_feita'),
           ('Relatório 2','Resumo de Entrevistas feitas por quem registrou a nota','2012-05-28',1,'sp_relat_ent_marcada'),
           ('Relatório 3','Resumo de Entrevistas feitas por quem registrou a nota','2012-05-28',1,'sp_relat_cdd_ok'),
           ('Relatório 4','Resumo de Entrevistas feitas por quem registrou a nota','2012-05-28',1,'sp_relat_cdd_ok_proj')
GO


