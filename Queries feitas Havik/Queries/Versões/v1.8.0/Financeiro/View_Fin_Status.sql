use havik_teste
go
create view vw_fin_status
as
SELECT TOP 100 [id]
      ,[descricao]
  FROM [br_fin_status]
order by descricao  