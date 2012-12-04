INSERT INTO bc_proj_oferta
           (
           id_projeto
           ,tp_contrato
           ,salario_mensal
           ,bonus
           ,total_cash
           ,dt_criacao
           ,usuario_criacao
			)

select proj.idOportunidade,
	   1,
	   proj.remMensal,
	   proj.bonus,
	   proj.totalCash,
	   GETDATE(),
	   isnull(proj.researcher_idUsuario,1)
		
from dbo.Projetos proj
	           