/****** Script for SelectTopNRows command from SSMS  ******/
use havik
go
alter procedure sp_vw_proj_anexos
as
SELECT [id]
      ,[descricao]
      ,[usuario_criacao]
      ,[dt_criacao]
  FROM [br_proj_tp_anexo]
  order by descricao
  