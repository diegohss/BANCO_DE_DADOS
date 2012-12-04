use havik
go
select base.id_empresa,
	   emp.nome empresa,
	   base.id id_filial,
	   base.codigo codigo_filial,
	   base.nome nome_filial,
	   base.endereco,
	   base.numero,
	   base.complemento,
	   base.bairro,
	   pais.nome pais,
	   cid.MUNNOME cidade,
	   uf.UFNOME estado,
	   base.cep,
	   base.site endereco_eletronico,
	   base.cod_pais,
	   base.ddd,
	   base.telefone	   
	   
	   
from bc_empresa_filial base
LEFT JOIN bc_empresa_unq emp on
	emp.id=base.id_empresa
left join br_paises pais on
	pais.id=base.pais
left join br_cidades cid on
	cid.MUNCOD=base.cidade
left join br_estados uf on
	uf.UFCOD=base.estado			
where base.id_empresa IN
(
7455,
1539,
2870,
4627,
3130
)