use havik_teste

go

begin

declare @id_cliente int = null

declare @nome varchar(200) = null

declare @id_cliente2 int = null

declare @nome2 varchar(200) = null

declare dup_simples cursor for

 

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

declare dup_excluir cursor for

select tmp.nome,tmp.id_cliente

from tmp_dup_clientes tmp

left join bh_cli_email email on

      email.id_cliente=tmp.id_cliente

where nome=@nome and email.descricao in (select descricao from bh_cli_email where id_cliente=@id_cliente)

open dup_excluir

fetch next from dup_excluir into @nome2,@id_cliente2

WHILE @@FETCH_STATUS <> -1

begin

 

-- Incluir e concatenar as informações nas tabelas

-- Incluir nas tabelas mudando a id_cliente2 para id_cliente nas novas inclusões

/*

Atualiza o base de arquivos do Candidato

*/

 

insert into bc_cli_base_cvs_dup

(

id_cliente,

nome_arquivo,

tipo_arquivo,

idioma,

caminho,

cv,

dados,

dt_criacao,

usuario_criacao

)

select

id_cliente,

nome_arquivo,

tipo_arquivo,

idioma,

caminho,

cv,

dados,

dt_criacao,

usuario_criacao

from bc_cli_base_cvs

where id_cliente=@id_cliente2

 

update cvs

set cvs.dados=arq.dados,

cvs.dt_criacao=arq.dt_criacao,

cvs.id_cliente=@id_cliente

from (select * from bc_cli_base_cvs where id_cliente=@id_cliente)cvs

inner join (select * from bc_cli_base_cvs where id_cliente=@id_cliente2)arq on

      arq.idioma=cvs.idioma

where convert(char(10),arq.dt_criacao,23)>convert(char(10),cvs.dt_criacao,23)

 

insert into bc_cli_base_cvs

(

id_cliente,

nome_arquivo,

tipo_arquivo,

idioma,

caminho,

cv,

dados,

dt_criacao,

usuario_criacao

)

select

@id_cliente,

arq.nome_arquivo,

arq.tipo_arquivo,

arq.idioma,

arq.caminho,

arq.cv,

arq.dados,

arq.dt_criacao,

arq.usuario_criacao

from (select * from bc_cli_base_cvs where id_cliente=@id_cliente)cvs

inner join (select * from bc_cli_base_cvs where id_cliente=@id_cliente2)arq on

      arq.idioma<>cvs.idioma

 

delete from bc_cli_base_cvs

where id_cliente=@id_cliente2

 

/*

Atualiza as notas da Entrevista do Candidato

*/

 

insert into bc_cli_consultor_dup

(

id_cliente,

a_senso,

a_saudacao,

a_impressao,

a_levantou,

a_profissionalismo,

c_senso,

c_eloquencia,

c_objetivo,

c_energia,

c_ouvinte,

c_mkt,

c_credibilidade,

c_estruturado,

p_inteligencia,

p_maturidade,

p_visao,

p_confianca,

p_honestidade,

p_punch,

p_carisma,

salario,

movimento,

mudanca,

usuario_alteracao,

dt_alteracao

)

select

id_cliente,

a_senso,

a_saudacao,

a_impressao,

a_levantou,

a_profissionalismo,

c_senso,

c_eloquencia,

c_objetivo,

c_energia,

c_ouvinte,

c_mkt,

c_credibilidade,

c_estruturado,

p_inteligencia,

p_maturidade,

p_visao,

p_confianca,

p_honestidade,

p_punch,

p_carisma,

salario,

movimento,

mudanca,

usuario_alteracao,

dt_alteracao

from bc_cli_consultor

where id_cliente=@id_cliente2

 

update bc_cli_consultor

set id_cliente=@id_cliente

where id_cliente=@id_cliente2

 

delete from bc_cli_consultor

where id_cliente=@id_cliente2

 

/*

Atualiza Hierarquia

*/

insert into bc_cli_hierarquia_dup

(

id_cliente,

reportase,

reportados,

qtd_subordinados,

qtd_subordinados_diretos,

usuario_alteracao,

dt_alteracao

)

select

id_cliente,

reportase,

reportados,

qtd_subordinados,

qtd_subordinados_diretos,

usuario_alteracao,

dt_alteracao

from bc_cli_hierarquia

where id_cliente=@id_cliente2

 

update bc_cli_hierarquia

set id_cliente=@id_cliente

where id_cliente=@id_cliente2 and not exists (select 1 from bc_cli_hierarquia where id_cliente=@id_cliente)

 

delete from bc_cli_hierarquia

where id_cliente=@id_cliente2

/*

Atualiza as notas da Pre-Entrevista do Candidato

*/

insert into bc_cli_researcher_dup

(

id_cliente,

c_senso,

c_eloquencia,

c_objetivo,

c_energia,

c_ouvinte,

c_mkt,

c_credibilidade,

c_estruturado,

p_inteligencia,

p_maturidade,

p_visao,

p_confianca,

p_honestidade,

p_punch,

p_carisma,

salario,

movimento,

mudanca,

usuario_alteracao,

dt_alteracao

)

select

id_cliente,

c_senso,

c_eloquencia,

c_objetivo,

c_energia,

c_ouvinte,

c_mkt,

c_credibilidade,

c_estruturado,

p_inteligencia,

p_maturidade,

p_visao,

p_confianca,

p_honestidade,

p_punch,

p_carisma,

salario,

movimento,

mudanca,

usuario_alteracao,

dt_alteracao

from bc_cli_researcher

where id_cliente=@id_cliente2

 

update bc_cli_researcher

set id_cliente=@id_cliente

where id_cliente=@id_cliente2

 

delete from bc_cli_researcher

where id_cliente=@id_cliente2

 

/*

Atualiza os dados Academicos

*/

insert into bh_cli_academico_dup

(

id_cliente,

id_escolaridade,

instituicao,

id_graduacao,

id_ano_formacao,

dt_alteracao,

usuario_criacao,

exibir,

ano_conclusao,

mes_conclusao

)

select

id_cliente,

id_escolaridade,

instituicao,

id_graduacao,

id_ano_formacao,

dt_alteracao,

usuario_criacao,

exibir,

ano_conclusao,

mes_conclusao

from bh_cli_academico

where id_cliente=@id_cliente2

 

update bh_cli_academico

set id_cliente=@id_cliente

where id_cliente=@id_cliente2

 

delete from bh_cli_academico

where id_cliente=@id_cliente2

/*

Atualiza os Beneficios

*/

insert into bh_cli_beneficios_dup

(

id_cliente,

id_beneficios,

dt_alteracao,

usuario_alteracao

)

select

id_cliente,

id_beneficios,

dt_alteracao,

usuario_alteracao

from bh_cli_beneficios

where id_cliente=@id_cliente2

 

update bh_cli_beneficios

set id_cliente=@id_cliente

where id_cliente=@id_cliente2 and id_beneficios not in (select id_beneficios from bh_cli_beneficios where id_cliente=@id_cliente)

 

delete from bh_cli_beneficios

where id_cliente=@id_cliente2

 

/*

Atualiza Cicatriz

*/

insert into bh_cli_cicatriz_dup

(

id_cicatriz,

id_cliente,

ativo,

dt_criacao,

usuario_criacao

)

select

id_cicatriz,

id_cliente,

ativo,

dt_criacao,

usuario_criacao

from bh_cli_cicatriz

where id_cliente=@id_cliente2

 

update bh_cli_cicatriz

set id_cliente=@id_cliente

where id_cliente=@id_cliente2

 

delete from bh_cli_cicatriz

where id_cliente=@id_cliente2

/*

Atualiza Codificação

*/

insert into bh_cli_codifica_dup

(

id_cliente,

id_area,

id_subdivisao,

id_segmento,

exibir,

usuario_alteracao,

dt_alteracao

)

select

id_cliente,

id_area,

id_subdivisao,

id_segmento,

exibir,

usuario_alteracao,

dt_alteracao

from bh_cli_codifica

where id_cliente=@id_cliente2

 

update bh_cli_codifica

set id_cliente=@id_cliente

where id_cliente=@id_cliente2

 

delete from bh_cli_codifica

where id_cliente=@id_cliente2

/*

Atualiza Comentario Entrevista

*/

insert into bh_cli_consultor_obs_dup

(

id_cliente,

obs,

dt_alteracao,

usuario_alteracao

)

select

id_cliente,

obs,

dt_alteracao,

usuario_alteracao

from bh_cli_consultor_obs

where id_cliente=@id_cliente2

 

update bh_cli_consultor_obs

set id_cliente=@id_cliente

where id_cliente=@id_cliente2

 

delete from bh_cli_consultor_obs

where id_cliente=@id_cliente2

/*

Atualiza Cursos

*/

insert into bh_cli_cursos_dup

(

id_cliente,

curso,

dt_criacao,

usuario_criacao,

exibir

)

select

id_cliente,

curso,

dt_criacao,

usuario_criacao,

exibir

from bh_cli_cursos

where id_cliente=@id_cliente2

 

update bh_cli_cursos

set id_cliente=@id_cliente

where id_cliente=@id_cliente2

 

delete from bh_cli_cursos

where id_cliente=@id_cliente2

/*

Atualiza Email

*/

insert into bh_cli_email_dup

(

id_cliente,

descricao,

dt_alteracao,

usuario_alteracao,

exibir

)

select

id_cliente,

descricao,

dt_alteracao,

usuario_alteracao,

exibir

from bh_cli_email

where id_cliente=@id_cliente2

 

update bh_cli_email

set id_cliente=@id_cliente

where id_cliente=@id_cliente2

 

delete from bh_cli_email

where id_cliente=@id_cliente2

/*

Atualiza Idiomas

*/

insert into bh_cli_idiomas_dup

(

id_cliente,

id_idioma,

id_nvl_idioma,

dt_criacao,

usuario_criacao,

exibir

)

select

id_cliente,

id_idioma,

id_nvl_idioma,

dt_criacao,

usuario_criacao,

exibir

from bh_cli_idiomas

where id_cliente=@id_cliente2

 

update bh_cli_idiomas

set id_cliente=@id_cliente

where id_cliente=@id_cliente2

 

delete from bh_cli_idiomas

where id_cliente=@id_cliente2

/*

Atualiza Indicação

*/

insert into bh_cli_indicado_dup

(

id_cliente,

id_indicado,

id_projeto,

dt_alteracao,

usuario_alteracao

)

select

id_cliente,

id_indicado,

id_projeto,

dt_alteracao,

usuario_alteracao

from bh_cli_indicado

where id_cliente=@id_cliente2

 

update bh_cli_indicado

set id_cliente=@id_cliente

where id_cliente=@id_cliente2

 

delete from bh_cli_indicado

where id_cliente=@id_cliente2

/*

Atualiza Perguntas e Respostas

*/

insert into bh_cli_perguntas_respostas_dup

(

id_pergunta,

id_resposta,

id_cliente,

dt_alteracao,

usuario_alteracao

)

select

id_pergunta,

id_resposta,

id_cliente,

dt_alteracao,

usuario_alteracao

from bh_cli_perguntas_respostas

where id_cliente=@id_cliente2

 

update bh_cli_perguntas_respostas

set id_cliente=@id_cliente

where id_cliente=@id_cliente2 and not exists (select 1 from bh_cli_perguntas_respostas t where t.id_cliente=@id_cliente and t.id_resposta=id_resposta)

 

delete from bh_cli_perguntas_respostas

where id_cliente=@id_cliente2

/*

Atualiza Histórico Profissional

*/

insert into bh_cli_profissional_dup

(

id_cliente,

id_empresa,

dt_inicio,

dt_saida,

id_segmento,

id_area,

id_subdivisao,

id_cargo,

salario,

bonus,

total_cash,

realizacoes,

dt_alteracao,

usuario_alteracao,

tipo_contato,

empresa_antiga,

produto,

id_filial,

id_tp_contrato,

vrl_mensal

)

select

id_cliente,

id_empresa,

dt_inicio,

dt_saida,

id_segmento,

id_area,

id_subdivisao,

id_cargo,

salario,

bonus,

total_cash,

realizacoes,

dt_alteracao,

usuario_alteracao,

tipo_contato,

empresa_antiga,

produto,

id_filial,

id_tp_contrato,

vrl_mensal

from bh_cli_profissional

where id_cliente=@id_cliente2

 

update bh_cli_profissional

set id_cliente=@id_cliente

where id_cliente=@id_cliente2

 

delete from bh_cli_profissional

where id_cliente=@id_cliente2

 

/*

Atualiza Projetos do cliente

*/

insert into bh_cli_projeto_dup

(

id_cliente,

id_projeto,

dt_criacao,

usuario_criacao

)

select

id_cliente,

id_projeto,

dt_criacao,

usuario_criacao

from bh_cli_projeto

where id_cliente=@id_cliente2

 

update bh_cli_projeto

set id_cliente=@id_cliente

where id_cliente=@id_cliente2 and id_projeto not in (select id_projeto from bh_cli_projeto where id_cliente=@id_cliente)

 

delete from bh_cli_projeto

where id_cliente=@id_cliente2

/*

Atualiza Comentario Pre-Entrevista

*/

insert into bh_cli_researcher_obs_dup

(

id_cliente,

obs,

dt_alteracao,

usuario_alteracao

)

select

id_cliente,

obs,

dt_alteracao,

usuario_alteracao

from bh_cli_researcher_obs

where id_cliente=@id_cliente2

 

update bh_cli_researcher_obs

set id_cliente=@id_cliente

where id_cliente=@id_cliente2

 

delete from bh_cli_researcher_obs

where id_cliente=@id_cliente2

/*

Atualiza Status Cliente

*/

insert into bh_cli_status_dup

(

id_cliente,

id_projeto,

id_status,

id_substatus,

obs,

dt_agendada,

dt_alteracao,

usuario_criacao,

hora,

entrevistador,

follow,

exibir,

id_motivo

)

select

id_cliente,

id_projeto,

id_status,

id_substatus,

obs,

dt_agendada,

dt_alteracao,

usuario_criacao,

hora,

entrevistador,

follow,

exibir,

id_motivo

from bh_cli_status

where id_cliente=@id_cliente2

 

update bh_cli_status

set id_cliente=@id_cliente

where id_cliente=@id_cliente2

 

delete from bh_cli_status

where id_cliente=@id_cliente2

/*

Atualiza Telefones

*/

insert into bh_cli_telefone_dup

(

id_cliente,

cod_pais,

ddd,

telefone,

dt_alteracao,

usuario_alteracao,

tp_telefone,

exibir

)

select

id_cliente,

cod_pais,

ddd,

telefone,

dt_alteracao,

usuario_alteracao,

tp_telefone,

exibir

from bh_cli_telefone

where id_cliente=@id_cliente2

 

update bh_cli_telefone

set id_cliente=@id_cliente

where id_cliente=@id_cliente2

 

delete from bh_cli_telefone

where id_cliente=@id_cliente2

/*

Atualiza Logs do Cliente

*/

insert into bh_cliente_dup

(

id_cliente,

tp_mudanca,

dt_alteracao,

usuario_alteracao,

tabela_alteracao

)

select

id_cliente,

tp_mudanca,

dt_alteracao,

usuario_alteracao,

tabela_alteracao

from bh_cliente

where id_cliente=@id_cliente2

 

update bh_cliente

set id_cliente=@id_cliente

where id_cliente=@id_cliente2

 

delete from bh_cliente

where id_cliente=@id_cliente2

/*

Atualiza Base de Clientes

*/

insert into bc_cliente_dup

(

nome,

cpf,

dt_nascimento,

id_estado_civil,

id_sexo,

endereco,

numero,

complemento,

cep,

bairro,

id_cidade,

id_estado,

id_pais,

dt_alteracao,

usuario_alteracao,

id_antiga,

tipo_contato,

empresa_contato,

ultimo_status,

ultimo_substatus,

produto,

nome_pai,

nome_mae,

rg,

id_uf_natural,

id_natural

)

select

nome,

cpf,

dt_nascimento,

id_estado_civil,

id_sexo,

endereco,

numero,

complemento,

cep,

bairro,

id_cidade,

id_estado,

id_pais,

dt_alteracao,

usuario_alteracao,

id_antiga,

tipo_contato,

empresa_contato,

ultimo_status,

ultimo_substatus,

produto,

nome_pai,

nome_mae,

rg,

id_uf_natural,

id_natural

from bc_cliente

where id=@id_cliente2

 

delete from bc_cliente

where id=@id_cliente2

 

-- Loop do 2º Cursor

fetch next from dup_excluir into @nome2,@id_cliente2

end

CLOSE dup_excluir

DEALLOCATE dup_excluir

--Loop do 1º Cursor

FETCH NEXT FROM dup_simples INTO @nome,@id_cliente

 

--Fim do 1º Cursor

END

 

CLOSE dup_simples

DEALLOCATE dup_simples

 

-- Fim da Procedure

end