select COUNT(distinct email.descricao)
from bc_cli_base_cvs base
inner join bh_cli_email email on
	email.id_cliente=base.id_cliente
where dados is not null and convert(char(10),dt_criacao,23)>='2011-12-27';

use havik
go
select COUNT(*) from bc_cliente base
where convert(char(10),base.dt_alteracao,23)<='2011-12-26';
