-- Projetos abertos e divulgados no site, durante um per�odo especificado
-- A informa��o se est� divulgado no site ou n�o � utilizado como informa��o e n�o como filtro
/*
"select site.id_oportunidade,site.dt_alteracao,job.nome_oportunidade," _
& " hun.nome_usuario,emp.nome empresa," _
& " car.nome_cargo Cargo,a.nome_area Area," _
& " s.nome Segmento,sub.nome_subdivisao Subdivisao, job.potencialHuntig" _
*/

select proj.id id_projeto,
	   

from bc_projeto proj

left join br_area area on
	area.id=proj.area
	
left join br_subdivisao sub on
	sub.id=proj.subdivisao
	
left join br_segmento seg on
	seg.id=proj.segmento
	
left join bc_empresa_unq emp on
	emp.id=proj.id_empresa			

where proj.dt_fim is null
and
convert(char(10),proj.dt_criacao,23) between '2012-01-01' and '2012-01-31'
