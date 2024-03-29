USE [havik]
GO
/****** Object:  StoredProcedure [dbo].[sp_cli_status]    Script Date: 02/10/2012 14:38:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER procedure [dbo].[sp_cli_status]
(
@tipo int,
@id_cliente int,
@id_projeto int = null,
@id_status int,
@id_substatus int = null,
@dt_agendada datetime = null,
@obs varchar(4000) = null,
@usuario int,
@entrevistador int = null,
@follow int = null,
@hora varchar(5) = null,
@motivo int = null,
@retorno int output
)
as

begin

SET NOCOUNT ON;

declare @teste int
declare @temp int

set @teste=(select COUNT(*) from bh_cli_projeto where id_cliente=@id_cliente and id_projeto=@id_projeto)

if @teste=0
begin
exec dbo.sp_cli_projeto @tipo=1,@id_cliente=@id_cliente,@id_projeto=@id_projeto,@usuario=@usuario,@retorno=@temp
end


if @tipo=1
begin
INSERT INTO bh_cli_status
           (
            id_cliente,
            id_projeto,
            id_status,
            id_substatus,
            obs,   
            dt_agendada,                     
            dt_alteracao,
            usuario_criacao,
            hora,
            entrevistador,
            follow,
            exibir,
            id_motivo
           )
     VALUES
           (
            @id_cliente,
            @id_projeto,
            @id_status,
            @id_substatus,
            @obs,
            @dt_agendada,
            GETDATE(),
            @usuario,
            CAST(@hora as time),
            @entrevistador,
            @follow,
            '1',
            @motivo
			)
			
	update bc_cliente
	set ultimo_status=@id_status,
		ultimo_substatus=@id_substatus
	where id=@id_cliente			

	   		insert into bh_cliente(id_cliente,tp_mudanca,dt_alteracao,usuario_alteracao,tabela_alteracao)
			values (@id_cliente,'inserção',GETDATE(),@usuario,'bh_cli_status')				

end	

if @id_status='7'
begin

	insert into bh_proj_status
	(
	id_projeto,
	id_status,
	id_substatus,
	obs,
	dt_alteracao,
	usuario_alteracao
	)
	values 
	(
	@id_projeto,
	'6',
	null,
	@obs,
	DATEADD(MINUTE,1,GETDATE()),
	@usuario
	)

	update bc_projeto
	set ultimo_status=@id_status,
		ultimo_substatus=@id_substatus
	where id=@id_projeto
	
		if @@error <> 0
		begin
			set @retorno=0
			return(@retorno)
		end
	   	else
	   	begin
	   		set @retorno=1
	   		insert into bh_projeto (id_projeto,tp_mudanca,dt_alteracao,usuario_alteracao,tabela_alteracao)
			values (@id_projeto,'inserção',GETDATE(),@usuario,'bh_proj_status')				
	   		return(@retorno)		   		
		end


end

end