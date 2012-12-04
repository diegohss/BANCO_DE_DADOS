use havik
go
create procedure sp_vw_proj_certificacao
(
@id_projeto int = null
)
as
SELECT 
	   base.id
      ,base.id_projeto
      ,base.descricao
      ,base.dt_criacao
      ,us.nome_usuario usuario_criacao
      ,exibir
  FROM bh_proj_certificacao base
  
  left join bc_usuario us on
	us.id=base.usuario_criacao
	
where id_projeto=@id_projeto  and exibir=1