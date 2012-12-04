SELECT top 20 idcandidato,referencia_1,
			 DATALENGTH(referencia_1) antes,
			 dbo.HTMLfullDecode2(referencia_1) referencia_sem_Tags,
			 datalength(dbo.HTMLfullDecode2(referencia_1))depois
from candidato
where referencia_1 is not null

