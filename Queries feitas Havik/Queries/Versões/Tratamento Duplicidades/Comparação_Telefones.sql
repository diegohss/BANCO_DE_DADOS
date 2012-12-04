use havik
go
/*select ltrim(rtrim(email.descricao)) email
from bh_cli_email email
where email.exibir=1
group by ltrim(rtrim(email.descricao))
having COUNT(distinct email.id_cliente)>1*/
select tel.id_cliente,
count(CAST(cast(ltrim(rtrim(tel.ddd)) as varchar(3)) + ltrim(rtrim(tel.telefone)) as varchar(20)))
from bh_cli_telefone tel
group by tel.id_cliente,CAST(cast(ltrim(rtrim(tel.ddd)) as varchar(3)) + ltrim(rtrim(tel.telefone)) as varchar(20))
having count(CAST(cast(ltrim(rtrim(tel.ddd)) as varchar(3)) + ltrim(rtrim(tel.telefone)) as varchar(20)))>1
order by 2 desc