INSERT INTO [havik].[dbo].[tr_proj_beneficios]
           ([descricao]
           ,[usuario_criacao]
           ,[dt_criacao])
values
('vale refeição','1',GETDATE()),
('vale alimentação','1',GETDATE()),
('vale transporte','1',GETDATE()),
('plano odonto','1',GETDATE()),
('plano de saúde','1',GETDATE()),
('previdência','1',GETDATE()),
('carro','1',GETDATE()),
('ações','1',GETDATE()), 
('incentivo educação','1',GETDATE()),
('outros','1',GETDATE())
GO
commit;

