INSERT INTO bh_proj_obs
           (
           id_projeto
           ,obs
           ,dt_alteracao
           ,usuario_alteracao
           )
select
	proj.idOportunidade,	
	dbo.HTMLFullDecode3(proj.comentarios),
	GETDATE(),
	isnull(proj.researcher_idUsuario,1)

from dbo.Projetos proj
		
where proj.comentarios is not null		




