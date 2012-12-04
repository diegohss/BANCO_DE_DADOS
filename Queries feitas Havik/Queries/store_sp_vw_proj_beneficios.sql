create procedure sp_vw_proj_beneficios (@id_projeto int)
as
SELECT base.id
      ,base.id_projeto
      ,base.beneficios id_beneficios
      ,ben.descricao beneficios
      ,base.dt_criacao
      ,col.nome_usuario
      
  FROM havik.dbo.bh_proj_beneficios base
  
  left join br_proj_beneficios ben on
	ben.id=base.beneficios
  
  left join bc_usuario col on
	col.id=base.usuario_criacao
  
  where base.id_projeto=@id_projeto
  
order by base.dt_criacao desc



