-- Acrescentar coluna filial, estado, cidade e bairro do candidato

use havik
go

select emp.id,emp.nome empresa,
       fil.codigo,fil.nome filial,
       uf.UFNOME estado_filial,
       cid.MUNNOME cidad_filial,
       fil.bairro

from bc_empresa_filial fil 
	
left join bc_empresa_unq emp on
	emp.id=fil.id_empresa
	
-- Cidade e Estado
left join br_cidades cid on
	cid.MUNCOD=fil.cidade
left join br_estados uf on
	uf.UFCOD=fil.estado			
	

