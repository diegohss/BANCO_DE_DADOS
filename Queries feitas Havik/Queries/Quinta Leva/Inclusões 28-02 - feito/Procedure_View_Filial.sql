USE [havik]
GO
/****** Object:  StoredProcedure [dbo].[sp_vw_emp_filiais]    Script Date: 02/28/2012 15:25:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[sp_vw_emp_filiais]
(
@id_empresa int
)
as
select 	
	  base.id,
      base.nome filial,
      base.cep,
      base.endereco,
      base.numero,
      base.complemento,      
      base.bairro,
      base.pais,
      base.estado,
      base.cidade,
      base.cod_pais,
      base.ddd,
      base.telefone, 
      base.email,
      base.site,
      dt_cadastro=dbo.fn_dateformat(base.dt_criacao,12),      
      col.nome_usuario,
      base.codigo
  
FROM bc_empresa_filial base

  left join bc_usuario col on
	col.id=base.usuario_criacao

where base.id_empresa=@id_empresa

order by base.dt_criacao desc