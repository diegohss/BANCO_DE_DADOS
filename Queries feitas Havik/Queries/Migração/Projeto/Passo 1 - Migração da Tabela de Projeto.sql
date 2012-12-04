use havik

go

SET IDENTITY_INSERT bc_projeto ON


go

IF EXISTS(SELECT * FROM bc_projeto2)

INSERT INTO dbo.bc_projeto(
	   [id]
      ,[nome]
      ,[id_empresa]
      ,[segmento]
      ,[area]
      ,[subdivisao]
      ,[cargo]
      ,[tipo_produto]
      ,[responsavel_captacao]
      ,[responsavel_entrega]
      ,[colaborador_responsavel]
      ,[dt_criacao]
      ,[usuario_criacao]
      ,[dt_ini]
      ,[dt_fim]
      ,[id_antiga]
      ,[ult_status]
      ,[id_requisitante]
      ,[id_rh]
      ,[id_cidade]
      ,[id_estado]
      ,[ultimo_status]
      ,[ultimo_substatus]
)
      
SELECT [id]
      ,[nome]
      ,[id_empresa]
      ,[segmento]
      ,[area]
      ,[subdivisao]
      ,[cargo]
      ,[tipo_produto]
      ,[responsavel_captacao]
      ,[responsavel_entrega]
      ,[colaborador_responsavel]
      ,[dt_criacao]
      ,[usuario_criacao]
      ,[dt_ini]
      ,[dt_fim]
      ,[id_antiga]
      ,[ult_status]
      ,[id_requisitante]
      ,[id_rh]
      ,[id_cidade]
      ,[id_estado]
      ,[ultimo_status]
      ,[ultimo_substatus]
      FROM dbo.bc_projeto2 TABLOCKX

go

SET IDENTITY_INSERT bc_projeto OFF


go

/*DROP TABLE bc_projeto2

go*/

--Exec sp_rename 'Tmp_Names', 'Names'

 
/*
--Code Snippet

--In this approach you can’t retain the existing data values on the newly created identity column;

--The identity column will hold the sequence of number

 

Alter Table Names Add Id_new Int Identity(1,1)

Go

 

Alter Table Names Drop Column ID

Go

 

Exec sp_rename 'Names.Id_new', 'ID','Column' */