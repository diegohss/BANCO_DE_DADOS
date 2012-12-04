select 
	cid.UFCOD cod_estado,
	uf.UFNOME estado,
	cid.MUNCOD cod_cidade,
	cid.MUNNOME cidade
	  


from br_cidades cid

left join br_estados uf on
	uf.UFCOD=cid.UFCOD