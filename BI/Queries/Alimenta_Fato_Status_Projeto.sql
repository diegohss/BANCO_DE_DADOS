INSERT INTO bi_kivah.dbo.fato_status_projeto
(
           cod_tempo
           ,cod_projeto
           ,cod_usuario
           ,cod_status
           ,cod_produto
           ,qtd_status
           ,meta_status
)
select tempo.cod_tempo,
	   proj.id cod_projeto,
	   base.usuario_alteracao cod_usuario,
	   st.id cod_status,
	   proj.tipo_produto cod_produto,
	   COUNT(base.id) qtd_status,
	   0 meta

from havik.dbo.bc_projeto proj

left join havik.dbo.bh_proj_status base on
	proj.id=base.id_projeto
	
left join bi_kivah.dbo.dim_tempo tempo on
	tempo.data=convert(char(10),base.dt_alteracao,23)
	
left join havik.dbo.bl_proj_status_substatus st on
	st.id_status=base.id_status and
	st.id_substatus=base.id_substatus
	
where tempo.cod_tempo>isnull((select MAX(cod_tempo) from bi_kivah.dbo.fato_status_projeto),0)	

group by 
	   tempo.cod_tempo,
	   base.id_projeto,
	   base.usuario_alteracao,
	   st.id,
	   proj.tipo_produto
	   
