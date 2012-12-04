create procedure sp_vw_emp_filiais
(
@id_empresa int
)
as
select 	
	   base.id
      ,base.id_empresa
      ,base.news
      ,base.dt_alteracao
      ,col.nome_usuario
  
FROM bh_emp_noticias base

  left join bc_usuario col on
	col.id=base.usuario_alteracao

where base.id_empresa=@id_empresa

order by base.dt_alteracao desc