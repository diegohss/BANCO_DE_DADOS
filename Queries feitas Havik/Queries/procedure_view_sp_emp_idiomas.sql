create procedure sp_vw_proj_idiomas (@id_projeto bigint)
as
SELECT base.id
      ,base.id_projeto
      ,idi.descricao
      ,base.nvl_idioma
      ,base.dt_criacao
      ,col.nome_usuario
  FROM bh_proj_idiomas base
  
  left join bc_usuario col on
	col.id=base.usuario_criacao
	
  left join br_idiomas idi on
	idi.id=base.idioma
	
	
where id_projeto=@id_projeto
order by dt_criacao desc
  

GO


