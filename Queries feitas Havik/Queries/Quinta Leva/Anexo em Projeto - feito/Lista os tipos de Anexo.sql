/****** Script for SelectTopNRows command from SSMS  ******/
use havik
go
create procedure sp_vw_proj_anexos
as
SELECT [id]
      ,[descricao]           
  FROM [br_proj_tp_anexo]
  order by descricao