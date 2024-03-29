USE [havik]
GO
/****** Object:  StoredProcedure [dbo].[sp_vw_relat_proj_cliente_cb]    Script Date: 03/08/2012 17:46:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[sp_vw_relat_proj_cliente_cb]
(
@tipo int,
@subtipo int,
@usuario int = null
)
as

begin

declare @variavel varchar(20)

/*
Parametros de Tipo
1 - Meus Projetos
3 - Projetos Havik
Parametros de Subtipo
1 - Todos
2 - Abertos
3 - Fechados
*/
-- Tipo=1 | Subtipo=1
if @tipo=1 and @subtipo=1
begin 

SELECT distinct
	  base.id id_projeto,
      cast(cast(base.id as varchar(10)) + ' - ' + base.nome as varchar(100)) projeto
      
  FROM bc_projeto base
	
  left join bh_cli_projeto proj on
	proj.id_projeto=base.id	  
	
where (base.colaborador_responsavel=@usuario or base.responsavel_entrega=@usuario or base.responsavel_captacao=@usuario)

order by cast(cast(base.id as varchar(10)) + ' - ' + base.nome as varchar(100))
end
-- Tipo=1 | Subtipo=2
if @tipo=1 and @subtipo=2
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
-- Tipo=1 | Subtipo=3

if @tipo=1 and @subtipo=3
begin 
SELECT distinct
	  base.id id_projeto,
      cast(cast(base.id as varchar(10)) + ' - ' + base.nome as varchar(100)) projeto
      
  FROM bc_projeto base
	
  left join bh_cli_projeto proj on
	proj.id_projeto=base.id	  
	
where (base.colaborador_responsavel=@usuario or base.responsavel_entrega=@usuario or base.responsavel_captacao=@usuario)
	  and base.dt_fim is not null
	
order by cast(cast(base.id as varchar(10)) + ' - ' + base.nome as varchar(100))
end


-- Projetos Havik
-- Tipo=3 | Subtipo=1
if @tipo=3 and @subtipo=1
begin

SELECT distinct
	  base.id id_projeto,
      cast(cast(base.id as varchar(10)) + ' - ' + base.nome as varchar(100)) projeto
      
  FROM bc_projeto base
	
  left join bh_cli_projeto proj on
	proj.id_projeto=base.id	  

--where base.dt_fim is null
	
order by cast(cast(base.id as varchar(10)) + ' - ' + base.nome as varchar(100))
end

-- Tipo=3 | Subtipo=1
if @tipo=3 and @subtipo=2
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

-- Tipo=3 | Subtipo=1
if @tipo=3 and @subtipo=3
begin

SELECT distinct
	  base.id id_projeto,
      cast(cast(base.id as varchar(10)) + ' - ' + base.nome as varchar(100)) projeto
      
  FROM bc_projeto base
	
  left join bh_cli_projeto proj on
	proj.id_projeto=base.id	  

where base.dt_fim is not null
	
order by cast(cast(base.id as varchar(10)) + ' - ' + base.nome as varchar(100))
end





end
