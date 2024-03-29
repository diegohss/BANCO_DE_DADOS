/****** Script for SelectTopNRows command from SSMS  ******/
create procedure sp_emp_offlimits
(
@tipo int,
@id_empresa bigint,
@offlimits bigint,
@id_area bigint,
@usuario int,
@retorno int output
)
as

begin

if @tipo=1
begin

INSERT INTO bh_emp_offlimits
           (
           id_empresa
           ,offlimits
           ,id_area
           ,usuario_criacao
           ,dt_criacao
           )
     VALUES
     (
           @id_empresa,
           @offlimits,
           @id_area,
           @usuario,
           getdate()
      )

		if @@error <> 0
		begin
		--	Set @erro=1
		--	Set @desc_erro = 'Ocorreu um erro ao atualizar....bla bla bla'
			set @retorno=0
		--	return (@erro)
		---	return (@desc_erro)
			return(@retorno)
		end
	   	else
	   	begin
	   		set @retorno=1	
	   	--	set @erro=0
	   	--	set @desc_erro=''
	   		insert into bh_projeto (id_projeto,tp_mudanca,dt_alteracao,usuario_alteracao,tabela_alteracao)
			values (@retorno,'inserção',GETDATE(),@usuario,'bh_emp_offlimits')		
	   		return(@retorno)		   		
	   	--	return (@erro)
		--	return (@desc_erro)
		end


end
end      