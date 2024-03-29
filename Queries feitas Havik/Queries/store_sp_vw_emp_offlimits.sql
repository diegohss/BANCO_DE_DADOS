/****** Script for SelectTopNRows command from SSMS  ******/
alter procedure sp_vw_emp_offlimits
(
@id_empresa int
)
as
SELECT base.id
      ,base.id_empresa
      ,base.offlimits id_offlimits
      ,lim.descricao offlimits
      ,base.id_area
      ,area.descricao area
      ,col.nome_usuario
      ,base.dt_criacao
      
  FROM havik.dbo.bh_emp_offlimits base 
  
    left join bc_usuario col on
	col.id=base.usuario_criacao
	
	left join br_emp_offlimits lim on
		lim.id=base.offlimits
	
	left join br_area area on
		area.id=base.id  
  
  where id_empresa=@id_empresa
  
  order by base.dt_criacao desc