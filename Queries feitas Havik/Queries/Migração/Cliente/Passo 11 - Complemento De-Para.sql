update bh_cli_status
set id_projeto=isnull(tt.oportunidades_idoportunidade,1354)
from complemtento_status tt
where id_projeto=1354 and tt.candidatos_idcandidato=id_cliente 
	  
	   
