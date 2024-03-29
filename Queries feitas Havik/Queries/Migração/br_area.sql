use havik

go

SET IDENTITY_INSERT br_area ON


go

IF EXISTS(SELECT * FROM br_area2)

INSERT INTO dbo.br_area(
[id]
,[descricao]
,[usuario_criacao]
,[dt_criacao]
)
      
SELECT [id]
,[descricao]
,[usuario_criacao]
,[dt_criacao]
      FROM dbo.br_area2 TABLOCKX

go

SET IDENTITY_INSERT br_area OFF


go

/*DROP TABLE br_area2

go*/

--Exec sp_rename 'Tmp_Names', 'Names'

 
/*
--Code Snippet

--In this approach you can�t retain the existing data values on the newly created identity column;

--The identity column will hold the sequence of number

 

Alter Table Names Add Id_new Int Identity(1,1)

Go

 

Alter Table Names Drop Column ID

Go

 

Exec sp_rename 'Names.Id_new', 'ID','Column' */