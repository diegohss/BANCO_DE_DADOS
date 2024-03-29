USE [havik]
GO
/****** Object:  StoredProcedure [dbo].[sp_vw_busca_proj_cliente_cb]    Script Date: 03/06/2012 11:17:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_vw_relat_proj_cliente_cb]
(
@tipo int,
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

SELECT distinct
	  base.id id_projeto,
      cast(cast(base.id as varchar(10)) + ' - ' + base.nome as varchar(100)) projeto
      
  FROM bc_projeto base
	
  left join bh_cli_projeto proj on
	proj.id_projeto=base.id	  
	
where (base.colaborador_responsavel=@usuario or base.responsavel_entrega=@usuario or base.responsavel_captacao=@usuario)
	  and base.dt_fim is null
	
order by cast(cast(base.id as varchar(10)) + ' - ' + base.nome as varchar(100))
end

if @tipo=3
begin

SELECT distinct
	  base.id id_projeto,
      cast(cast(base.id as varchar(10)) + ' - ' + base.nome as varchar(100)) projeto
      
  FROM bc_projeto base
	
  left join bh_cli_projeto proj on
	proj.id_projeto=base.id	  

where base.dt_fim is null
	
order by cast(cast(base.id as varchar(10)) + ' - ' + base.nome as varchar(100))
end


end
