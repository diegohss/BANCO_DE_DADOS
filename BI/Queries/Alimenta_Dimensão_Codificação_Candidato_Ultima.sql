INSERT INTO bi_kivah.dbo.dim_codi_candidato_ult
(
           cod_candidato
           ,cod_codificacao
           ,area
           ,subdivisao
           ,segmento
)
select final.cod_candidato,final.cod_codificao,final.area,final.subdivisao,final.segmento
from(select distinct 
      base.cod_candidato,
	  cast(CAST(isnull(lnk.id,0) as varchar(10)) +
	  cast(isnull(base.id_area,0) as varchar(10))+
	  cast(isnull(base.id_subdivisao,0) as varchar(10))+
	  cast(isnull(base.id_segmento,0) as varchar(10)) as int) cod_codificao,
	  area.descricao area,
	  sub.descricao subdivisao,
	  seg.descricao segmento
from(
select distinct base.id_cliente cod_candidato,base.id_area,base.id_subdivisao,
	   base.id_segmento
from (select id_cliente,max(id) id
from havik.dbo.bh_cli_codifica
group by id_cliente)t 
left join havik.dbo.bh_cli_codifica base on
	base.id=t.id
)base
left join havik.dbo.bl_area_subdivisao lnk on
 lnk.id_area=base.id_area and
 lnk.id_subdivisao=base.id_subdivisao
left join havik.dbo.br_area area on
	area.id=base.id_area	 
left join havik.dbo.br_subdivisao sub on
	sub.id=base.id_subdivisao	
left join havik.dbo.br_segmento seg on
	seg.id=base.id_segmento	
)final	
left join bi_kivah.dbo.dim_codi_candidato_ult rep on
    rep.cod_candidato=final.cod_candidato and
	rep.cod_codificacao=final.cod_codificao
where rep.cod_codificacao is null



