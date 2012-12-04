-- Relatório para extração de clientes ativos com base nos jobs atuais;
use havik
go
select 
	   cap.nome_usuario resp_captacao,
	   ent.nome_usuario resp_entrega, 
	   proj.id_empresa,
	   emp.nome cliente,
	   proj.tipo_produto,
	   prod.descricao produto,
	   count(proj.id) qtd_projetos	

from bc_projeto proj

left join bc_empresa_unq emp on
	emp.id=proj.id_empresa
	
left join br_tp_produto prod on
	prod.id=proj.tipo_produto
	
left join bc_usuario cap on
	cap.id=proj.responsavel_captacao	
	
left join bc_usuario ent on
	ent.id=proj.responsavel_entrega	
	
where proj.dt_fim is null and emp.id not in (5,6)

group by 
cap.nome_usuario,
ent.nome_usuario,
proj.id_empresa,
emp.nome,
proj.tipo_produto,
prod.descricao

