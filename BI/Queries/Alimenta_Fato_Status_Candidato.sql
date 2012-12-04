INSERT INTO bi_kivah.dbo.fato_status_candidato
(
           cod_tempo
           ,cod_usuario
           ,cod_status
           ,qtd_status
           ,qtd_candidatos
           ,meta_status
)
select tempo.cod_tempo,
	   base.usuario_criacao cod_usuario,
	   st.id cod_status,
	   COUNT(distinct base.id_cliente) qtd_candidatos,
	   COUNT(base.id) qtd_status,
	   0 meta

from havik.dbo.bc_cliente cli

left join havik.dbo.bh_cli_status base on
	cli.id=base.id_projeto
	
left join bi_kivah.dbo.dim_tempo tempo on
	tempo.data=convert(char(10),base.dt_alteracao,23)
	
left join havik.dbo.bl_cli_status_substatus st on
	st.id_status=base.id_status and
	st.id_substatus=base.id_substatus
	
where tempo.cod_tempo>isnull((select MAX(cod_tempo) from bi_kivah.dbo.fato_status_projeto),0)	

group by 
	   tempo.cod_tempo,
	   base.usuario_criacao,
	   st.id

