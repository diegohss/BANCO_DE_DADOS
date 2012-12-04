use havik

go

SET IDENTITY_INSERT bc_cliente ON


go

IF EXISTS(SELECT * FROM bc_cliente2)

INSERT INTO dbo.bc_cliente(
	   [id]
      ,[nome]
      ,[cpf]
      ,[dt_nascimento]
      ,[id_estado_civil]
      ,[id_sexo]
      ,[endereco]
      ,[numero]
      ,[complemento]
      ,[cep]
      ,[bairro]
      ,[id_cidade]
      ,[id_estado]
      ,[id_pais]
      ,[dt_alteracao]
      ,[usuario_alteracao]
      ,[id_antiga]
      ,[tipo_contato]
      ,[empresa_contato]
      ,[ultimo_status]
      ,[ultimo_substatus]
)
      
SELECT 
	   [id]
      ,[nome]
      ,[cpf]
      ,[dt_nascimento]
      ,[id_estado_civil]
      ,[id_sexo]
      ,[endereco]
      ,[numero]
      ,[complemento]
      ,[cep]
      ,[bairro]
      ,[id_cidade]
      ,[id_estado]
      ,[id_pais]
      ,[dt_alteracao]
      ,[usuario_alteracao]
      ,[id_antiga]
      ,[tipo_contato]
      ,[empresa_contato]
      ,[ultimo_status]
      ,[ultimo_substatus]
      
      FROM dbo.bc_cliente2 TABLOCKX

go

SET IDENTITY_INSERT bc_cliente OFF


go

/*DROP TABLE bc_cliente2

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