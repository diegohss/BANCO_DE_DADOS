/*
r_emp_address
tableoid	Padrão
cmax	Padrão
xmax	Padrão
cmin	Padrão
xmin	Padrão
oid	Padrão
ctid	Padrão
employee_id	Cod Candidato
emp_street	Endreço Candidato
emp_city	Cidade Candidato
emp_state	Estado Candidato
emp_zip	CEP Candidato
emp_country	Pais Candidato
emp_phone_num	Telefone Candidato  (com ddd)
*/
-- r_emp_address
-- drop table bi_kivah.dbo.r_emp_address
select base.id employee_id,
	   ltrim(rtrim(cast(left(base.endereco,20) as CHAR(20)))) emp_street,
	   ltrim(rtrim(cast(left(cid.MUNNOME,30) as CHAR(30)))) emp_city,
	   ltrim(rtrim(cast(left(uf.UFNOME,30) as CHAR(30)))) emp_state,
	   cast(havik.dbo.limpa_telefone(base.cep) as int) emp_zip,
	   ltrim(rtrim(cast(left(pais.nome,30) as CHAR(30)))) emp_country,
	   tel.telefone emp_phone_num
	   
into bi_kivah.dbo.r_emp_address
from havik.dbo.bc_cliente base

left join havik.dbo.br_estados uf on
	uf.UFCOD=base.id_estado

left join havik.dbo.br_cidades cid on
	cid.MUNCOD=base.id_cidade
	
left join havik.dbo.br_paises pais on
	pais.id=base.id_pais
	
left join 
(
select ult.id_cliente,
cast(cast(ult.ddd as varchar(4))+ '-' + cast(ult.telefone as varchar(10)) as varchar(20)) telefone 
from(
select id_cliente,max(id) id
from havik.dbo.bh_cli_telefone
where exibir=1
group by id_cliente
)t
left join havik.dbo.bh_cli_telefone ult on
	ult.id=t.id
)tel on
	tel.id_cliente=base.id	
where base.id is not null