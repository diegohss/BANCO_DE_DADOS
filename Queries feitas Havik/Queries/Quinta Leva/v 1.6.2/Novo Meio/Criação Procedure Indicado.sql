USE [havik]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[sp_cli_indicado]
(
@id_cliente int = null,
@indicado int = null,
@id_projeto int = null,
@usuario int = null,
@retorno int output
)
as

begin

SET NOCOUNT ON;

declare @teste int
declare @temp int

set @teste=(select COUNT(*) from bh_cli_indicado where id_cliente=@id_cliente and id_projeto=@id_projeto)


if @teste=0 and @indicado<>''
begin
INSERT INTO bh_cli_indicado
           (
            id_cliente,
            id_indicado,
            id_projeto,
            dt_alteracao,
            usuario_alteracao          
           )
     VALUES
           (
            @id_cliente,
            @indicado,
            @id_projeto,
            GETDATE(),
            @usuario
			)
			
	   		insert into bh_cliente(id_cliente,tp_mudanca,dt_alteracao,usuario_alteracao,tabela_alteracao)
			values (@id_cliente,'inserção',GETDATE(),@usuario,'bh_cli_indicado')				
end			
			

if @teste>0 and @indicado<>''
begin
update bh_cli_indicado
set id_indicado=@indicado,
    dt_alteracao=GETDATE(),
    usuario_alteracao=@usuario 
where id_cliente=@id_cliente and id_projeto=@id_projeto     
      		
	   		insert into bh_cliente(id_cliente,tp_mudanca,dt_alteracao,usuario_alteracao,tabela_alteracao)
			values (@id_cliente,'update',GETDATE(),@usuario,'bh_cli_indicado')				
end		


end	