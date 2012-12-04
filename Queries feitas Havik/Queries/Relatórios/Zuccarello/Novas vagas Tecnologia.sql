-- Relat�rio Juliana Zuccarello
/*
Ent�o queremos retomar todos os contatos realizados at� o momento de profissionais 
n�vel analista / �rea de desenvolvimento / e que a gente tenha colocado na pr�-entrevista que o conhecimento � 
JAVA, C, C++, PHP, etc...   
*/
select distinct base.id_cliente,cli.nome,dbo.calculaidade(cli.dt_nascimento) idade,
				base.obs
				
from bh_cli_researcher_obs base

		left join bc_cliente cli on
			cli.id=base.id_cliente
		left join bh_cli_email email on
			email.id_cliente=base.id_cliente and
			email.exibir=1
		left join bh_cli_telefone tel on
			tel.id_cliente=base.id_cliente and
			tel.exibir=1
		left join bh_cli_codifica codi on
			codi.id_cliente=base.id_cliente
        left join bh_cli_profissional prof on
			prof.id_cliente=base.id_cliente
		left join bh_cli_cicatriz cic on
			cic.id_cliente=base.id_cliente				

where (base.obs like '%php%' or base.obs like '%java%' or base.obs like '%c++%' or base.obs like '%.net%' 
	   or base.obs like '%visual basic%' or base.obs like '%c#%'
	   or base.obs like '%delphi%' or base.obs like '%asp%')
	  and
	  (codi.id_area=7) 
	  and
	  (prof.id_cargo in (2,3,4,25)) 
	  and
	  cic.id_cliente is null
	  
-- and codi.id_subdivisao=92	  
	   			