use havik
go
insert into bh_cli_status( id_cliente,
dt_agendada,
id_status,
id_projeto,
id_substatus,
dt_alteracao,
usuario_criacao,
exibir)
select cli.id,
DataAplicacao,
1,
pro.id,
3,
getdate(),
28,
1
from site.CandidadoOportunidade
inner join bc_projeto pro on
	pro.id=idOportunidade
inner join bc_cliente cli on
 cli.id_antiga=idCandidatoSite
 where cast(cast(pro.id as varchar(10)) + cast(cli.id as varchar(10)) as varchar(20)) not in 
 (select cast(cast(pc.id_projeto as varchar(10)) + cast(pc.id_cliente as varchar(10)) as varchar(20))
 from bh_cli_status pc
 where pc.id_cliente=cli.id and pc.id_projeto=pro.id)