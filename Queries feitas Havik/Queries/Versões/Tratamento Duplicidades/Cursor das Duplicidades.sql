use havik
go
begin
declare @id_cliente int = null
declare @nome varchar(200) = null
declare dup_simples cursor for
declare dup_excluir cursor for

-- Inicio da tabela de Dados
select LTRIM(RTRIM(base.nome)) nome,isnull(MAX(base.id_cliente),MAX(base.id_tel)) id_cliente
from(
select LTRIM(RTRIM(base.nome)) nome,email.id_cliente,tele.id_cliente id_tel

from bc_cliente base

inner join(
select LTRIM(RTRIM(cli.nome)) nome
from bc_cliente cli
group by LTRIM(RTRIM(cli.nome))
having COUNT(LTRIM(RTRIM(cli.nome)))>1
)dupcli on
	dupcli.nome=LTRIM(RTRIM(base.nome))

-- E-Mail
left join(		
select email.id_cliente,ltrim(rtrim(email.descricao)) email
from bh_cli_email email
inner join(
select ltrim(rtrim(email.descricao)) email
from bh_cli_email email
where email.exibir=1
group by ltrim(rtrim(email.descricao))
having COUNT(distinct email.id_cliente)>1
)dupmail on
	dupmail.email=ltrim(rtrim(email.descricao))
)email on
	email.id_cliente=base.id
	
-- Telefone

left join(
select tel.id_cliente
from bh_cli_telefone tel
inner join(
select ddd,telefone
from bh_cli_telefone
WHERE tp_telefone NOT IN (1,4)
group by ddd,telefone
having COUNT(distinct id_cliente)>1 
)duptel on
	duptel.ddd=tel.ddd and
	duptel.telefone=tel.telefone
)tele on
	tele.id_cliente=base.id	
	
where (email.id_cliente is not null or tele.id_cliente is not null)

)base
group by LTRIM(RTRIM(base.nome))
order by LTRIM(RTRIM(base.nome))

-- Abertura do 1º Cursor

open dup_simples 

fetch next from dup_simples into @nome,@id_cliente

WHILE @@FETCH_STATUS <> -1
begin

-- Abertura do 2º Cursor
-- FIltrando os nomes iguais nas 2 tabelas ... depois comparando os emails
-- Em sendo iguais iniciar os passos da deduplicação

FETCH NEXT FROM dup_simples INTO @id_cliente

END

CLOSE dup_simples
DEALLOCATE dup_simples

-- Fim da Procedure
end