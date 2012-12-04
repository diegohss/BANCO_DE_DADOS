use havik_teste
go
create procedure sp_vw_cli_prof_empresa
(
@empresa varchar(50)=null
)
as
select emp.id,
	   emp.nome,
	   emp.razao_social,
	   cid.MUNNOME cidade,
	   uf.UFNOME uf,
	   COUNT(proj.id) qtd_proj_havik
	   
from bc_empresa_unq emp

left join br_cidades cid on
	cid.MUNCOD=emp.cidade
	
left join br_estados uf on
	uf.UFCOD=emp.estado	
	
left join bc_projeto proj on
	proj.id_empresa=emp.id	
	
	
where (emp.nome like '%' + @empresa + '%') or (emp.razao_social like '%' + @empresa + '%')

group by 
	   emp.id,
	   emp.nome,
	   emp.razao_social,
	   cid.MUNNOME,
	   uf.UFNOME