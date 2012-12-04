USE [havik]
GO
/****** Object:  StoredProcedure [dbo].[sp_vw_busca_proj_cliente_cb]    Script Date: 12/14/2011 15:02:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
alter procedure [dbo].[sp_vw_cli_proj_cliente_cb]
(
@tipo int,
@id_cliente int = null,
@usuario int = null
)
as

begin

/*
1 - Meus Projetos
2 - Projetos do Cliente
3 - Projetos Havik
*/

if @tipo=1

begin 

SELECT 
	  base.id id_projeto,
      base.nome projeto
      
  FROM bc_projeto base
	
  inner join bh_cli_projeto proj on
	proj.id_projeto=base.id	  
	
where (base.colaborador_responsavel=@usuario or base.responsavel_entrega=@usuario or base.responsavel_captacao=@usuario)
	  and base.dt_fim is null
	
order by base.nome

end

if @tipo=2
begin
SELECT 
	  base.id id_projeto,
      base.nome projeto      
  FROM bc_projeto base
	
  inner join bh_cli_projeto proj on
	proj.id_projeto=base.id	  
	
where proj.id_cliente=@id_cliente and base.dt_fim is null
	
order by base.nome
end

if @tipo=3
begin

SELECT 
	  base.id id_projeto,
      base.nome projeto
      
  FROM bc_projeto base
	
  inner join bh_cli_projeto proj on
	proj.id_projeto=base.id	  

where base.dt_fim is not null
	
order by base.nome
end


end
