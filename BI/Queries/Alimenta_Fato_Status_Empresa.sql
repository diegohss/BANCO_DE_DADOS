INSERT INTO bi_kivah.dbo.fato_status_empresa
           (
           cod_tempo
           ,cod_empresa
           ,cod_usuario
           ,cod_status
           ,qtd_status
           ,meta_status
           )
select tempo.cod_tempo,
	   base.id_empresa cod_empresa,
	   base.usuario_alteracao cod_usuario,
	   st.id cod_status,
	   COUNT(base.id) qtd_status,
	   0 meta

from havik.dbo.bc_empresa_unq emp

left join havik.dbo.bh_emp_status base on
	emp.id=base.id_empresa
	
left join bi_kivah.dbo.dim_tempo tempo on
	tempo.data=convert(char(10),base.dt_alteracao,23)
	
left join havik.dbo.bl_emp_status_substatus st on
	st.id_status=base.id_status and
	st.id_substatus=base.id_substatus
	
where tempo.cod_tempo>isnull((select MAX(cod_tempo) from bi_kivah.dbo.fato_status_projeto),0)	

group by 
	 tempo.cod_tempo,
	 base.id_empresa,
	 base.usuario_alteracao,
	 st.id
