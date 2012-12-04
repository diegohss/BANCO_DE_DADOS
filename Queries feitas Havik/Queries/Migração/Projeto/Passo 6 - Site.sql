INSERT INTO havik.dbo.bc_proj_site
           (
           id_projeto
           ,descricao_completa
           ,resumo_descricao
           ,mostrar_site
           ,dt_alteracao
           ,usuario_alteracao
           )
           
select proj.idOportunidade,
	   dbo.HTMLFullDecode3(proj.anuncios),
	   null,
	   isnull(replace(replace(proj.potencialHuntig,'nao',0),'sim',1),0),
	   GETDATE(),
	   isnull(proj.researcher_idUsuario,1)
		
from dbo.Projetos proj
	           
where proj.anuncios is not null


