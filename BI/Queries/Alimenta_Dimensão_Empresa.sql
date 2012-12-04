INSERT INTO bi_kivah.dbo.dim_empresa
(
           cod_empresa
           ,nome_empresa
           ,segmento
           ,cidade
           ,estado
           ,offlimits
           ,grupo
           ,cliente_havik
)


select base.id cod_empresa,
	   isnull(base.nome,'') nome_empresa,
	   seg.descricao segmento,
	   cid.MUNNOME cidade,
	   uf.UFNOME estado,
	   ofl.descricao offlimits,
	   grupo.nome grupo,
	   case 
	   when proj.qtd>0 then	
			'true'
	   else 
			'false'
	   end cliente_havik
from havik.dbo.bc_empresa_unq base
left join havik.dbo.br_segmento seg on
	seg.id=base.segmento
left join havik.dbo.br_cidades cid on
	cid.MUNCOD=base.cidade
left join havik.dbo.br_estados uf on
	uf.UFCOD=base.estado
left join havik.dbo.br_emp_offlimits ofl on
	ofl.id=base.offlimits
left join havik.dbo.bc_empresa_grupo grupo on
	grupo.id=base.id_grupo
left join(
select prj.id_empresa,COUNT(prj.id) qtd
from havik.dbo.bc_projeto prj 
group by prj.id_empresa
)proj on
	proj.id_empresa=base.id
left join bi_kivah.dbo.dim_empresa rep on
	rep.cod_empresa=base.id
where rep.cod_empresa is null
	