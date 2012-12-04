/* Alimenta a Dimensão Cargo */

INSERT INTO bi_kivah.dbo.dim_cargo
(
           cod_cargo
           ,cargo
)
select id,descricao
from havik.dbo.br_cargo base
left join bi_kivah.dbo.dim_cargo rep on
	rep.cod_cargo=base.id
where rep.cod_cargo is null
go

INSERT INTO bi_kivah.dbo.dim_codificacao
(
           cod_codificacao
           ,area
           ,subdivisao
           ,segmento
) 
select base.cod_codificao,base.area,base.subdivisao,base.segmento
from(select distinct cast(CAST(isnull(lnk.id,0) as varchar(10)) +
	  cast(isnull(base.id_area,0) as varchar(10))+
	  cast(isnull(base.id_subdivisao,0) as varchar(10))+
	  cast(isnull(base.id_segmento,0) as varchar(10)) as int) cod_codificao,
	  area.descricao area,
	  sub.descricao subdivisao,
	  seg.descricao segmento
from(
select base.id_area,base.id_subdivisao,base.id_segmento
from havik.dbo.bh_cli_codifica base
group by base.id_area,base.id_subdivisao,base.id_segmento
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
)base	
left join bi_kivah.dbo.dim_codificacao rep on
	rep.cod_codificacao=base.cod_codificao
where rep.cod_codificacao is null
go

INSERT INTO bi_kivah.dbo.dim_produto
(
           cod_produto
           ,produto
)
select id,descricao
from havik.dbo.br_tp_produto base
left join bi_kivah.dbo.dim_produto rep on
	rep.cod_produto=base.id
where rep.cod_produto is null