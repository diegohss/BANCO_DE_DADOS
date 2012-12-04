use havik
go
/*
insert into bh_cli_projeto
(id_cliente,
id_projeto,
dt_criacao,
usuario_criacao
)*/
select cli.id,pro.id, DataAplicacao,28
from site.CandidadoOportunidade
inner join bc_projeto pro on
	pro.id=idOportunidade
inner join bc_cliente cli on
 cli.id_antiga=idCandidatoSite
 where cast(cast(pro.id as varchar(10)) + cast(cli.id as varchar(10)) as varchar(20)) not in 
 (select cast(cast(pc.id_projeto as varchar(10)) + cast(pc.id_cliente as varchar(10)) as varchar(20))
 from bh_cli_projeto pc
 where pc.id_cliente=cli.id and pc.id_projeto=pro.id)