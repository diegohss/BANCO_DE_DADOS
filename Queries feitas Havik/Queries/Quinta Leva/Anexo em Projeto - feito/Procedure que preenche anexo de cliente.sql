/****** Script for SelectTopNRows command from SSMS  ******/
use havik
go
create procedure sp_vw_cli_prof_anexo
as
SELECT [id]
      ,[descricao]
      ,[usuario_criacao]
      ,[dt_criacao]
  FROM [br_cli_cvs_idiomas]
  order by descricao