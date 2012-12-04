use havik
go
-- Anexos do Cliente
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
dup.id_nova,
arq.nome_arquivo,
arq.tipo_arquivo,
arq.idioma,
arq.caminho,
arq.cv,
arq.dados,
arq.dt_criacao,
arq.usuario_criacao
from bc_cli_base_cvs_dup arq
inner join tmp_cli_dup_faltantes dup on
	dup.id_cliente=arq.id_cliente
	
/*
Atualiza as notas da Entrevista do Candidato 
*/

insert into bc_cli_consultor
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
dup.id_nova,
t.a_senso,
t.a_saudacao,
t.a_impressao,
t.a_levantou,
t.a_profissionalismo,
t.c_senso,
t.c_eloquencia,
t.c_objetivo,
t.c_energia,
t.c_ouvinte,
t.c_mkt,
t.c_credibilidade,
t.c_estruturado,
t.p_inteligencia,
t.p_maturidade,
t.p_visao,
t.p_confianca,
t.p_honestidade,
t.p_punch,
t.p_carisma,
t.salario,
t.movimento,
t.mudanca,
t.usuario_alteracao,
t.dt_alteracao
from bc_cli_consultor_dup t
inner join tmp_cli_dup_faltantes dup on
	dup.id_cliente=t.id_cliente
	
/*
Atualiza Hierarquia
*/
insert into bc_cli_hierarquia
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
dup.id_nova,
t.reportase,
t.reportados,
t.qtd_subordinados,
t.qtd_subordinados_diretos,
t.usuario_alteracao,
t.dt_alteracao
from bc_cli_hierarquia_dup t
inner join tmp_cli_dup_faltantes dup on
	dup.id_cliente=t.id_cliente
	
/*
Atualiza as notas da Pre-Entrevista do Candidato 
*/
insert into bc_cli_researcher
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
dup.id_nova,
t.c_senso,
t.c_eloquencia,
t.c_objetivo,
t.c_energia,
t.c_ouvinte,
t.c_mkt,
t.c_credibilidade,
t.c_estruturado,
t.p_inteligencia,
t.p_maturidade,
t.p_visao,
t.p_confianca,
t.p_honestidade,
t.p_punch,
t.p_carisma,
t.salario,
t.movimento,
t.mudanca,
t.usuario_alteracao,
t.dt_alteracao
from bc_cli_researcher_dup t
inner join tmp_cli_dup_faltantes dup on
	dup.id_cliente=t.id_cliente
	
/*
Atualiza os dados Academicos
*/
insert into bh_cli_academico
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
dup.id_nova,
t.id_escolaridade,
t.instituicao,
t.id_graduacao,
t.id_ano_formacao,
t.dt_alteracao,
t.usuario_criacao,
t.exibir,
t.ano_conclusao,
t.mes_conclusao
from bh_cli_academico_dup t
inner join tmp_cli_dup_faltantes dup on
	dup.id_cliente=t.id_cliente
	
/*
Atualiza os Beneficios
*/
insert into bh_cli_beneficios
(
id_cliente,
id_beneficios,
dt_alteracao,
usuario_alteracao
)
select
dup.id_nova,
t.id_beneficios,
t.dt_alteracao,
t.usuario_alteracao
from bh_cli_beneficios_dup t
inner join tmp_cli_dup_faltantes dup on
	dup.id_cliente=t.id_cliente
	
/*
Atualiza Cicatriz
*/
insert into bh_cli_cicatriz
(
id_cicatriz,
id_cliente,
ativo,
dt_criacao,
usuario_criacao
)
select
t.id_cicatriz,
dup.id_nova,
t.ativo,
t.dt_criacao,
t.usuario_criacao
from bh_cli_cicatriz_dup t
inner join tmp_cli_dup_faltantes dup on
	dup.id_cliente=t.id_cliente

/*
Atualiza Codificação
*/
insert into bh_cli_codifica
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
dup.id_nova,
t.id_area,
t.id_subdivisao,
t.id_segmento,
t.exibir,
t.usuario_alteracao,
t.dt_alteracao
from bh_cli_codifica_dup t
inner join tmp_cli_dup_faltantes dup on
	dup.id_cliente=t.id_cliente
	
/*
Atualiza Comentario Entrevista
*/
insert into bh_cli_consultor_obs
(
id_cliente,
obs,
dt_alteracao,
usuario_alteracao
)
select
dup.id_nova,
t.obs,
t.dt_alteracao,
t.usuario_alteracao
from bh_cli_consultor_obs_dup t
inner join tmp_cli_dup_faltantes dup on
	dup.id_cliente=t.id_cliente

/*
Atualiza Cursos
*/
insert into bh_cli_cursos
(
id_cliente,
curso,
dt_criacao,
usuario_criacao,
exibir
)
select
dup.id_nova,
t.curso,
t.dt_criacao,
t.usuario_criacao,
t.exibir
from bh_cli_cursos_dup t
inner join tmp_cli_dup_faltantes dup on
	dup.id_cliente=t.id_cliente

/*
Atualiza Email
*/
insert into bh_cli_email
(
id_cliente,
descricao,
dt_alteracao,
usuario_alteracao,
exibir
)
select
dup.id_nova,
t.descricao,
t.dt_alteracao,
t.usuario_alteracao,
t.exibir
from bh_cli_email_dup t
inner join tmp_cli_dup_faltantes dup on
	dup.id_cliente=t.id_cliente

/*
Atualiza Idiomas
*/
insert into bh_cli_idiomas
(
id_cliente,
id_idioma,
id_nvl_idioma,
dt_criacao,
usuario_criacao,
exibir
)
select
dup.id_nova,
t.id_idioma,
t.id_nvl_idioma,
t.dt_criacao,
t.usuario_criacao,
t.exibir
from bh_cli_idiomas_dup t
inner join tmp_cli_dup_faltantes dup on
	dup.id_cliente=t.id_cliente

/*
Atualiza Indicação
*/
insert into bh_cli_indicado
(
id_cliente,
id_indicado,
id_projeto,
dt_alteracao,
usuario_alteracao
)
select
dup.id_nova,
t.id_indicado,
t.id_projeto,
t.dt_alteracao,
t.usuario_alteracao
from bh_cli_indicado_dup t
inner join tmp_cli_dup_faltantes dup on
	dup.id_cliente=t.id_cliente

/*
Atualiza Perguntas e Respostas
*/
insert into bh_cli_perguntas_respostas
(
id_pergunta,
id_resposta,
id_cliente,
dt_alteracao,
usuario_alteracao
)
select
t.id_pergunta,
t.id_resposta,
dup.id_nova,
t.dt_alteracao,
t.usuario_alteracao
from bh_cli_perguntas_respostas_dup t
inner join tmp_cli_dup_faltantes dup on
	dup.id_cliente=t.id_cliente

/*
Atualiza Histórico Profissional
*/
insert into bh_cli_profissional
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
dup.id_nova,
t.id_empresa,
t.dt_inicio,
t.dt_saida,
t.id_segmento,
t.id_area,
t.id_subdivisao,
t.id_cargo,
t.salario,
t.bonus,
t.total_cash,
t.realizacoes,
t.dt_alteracao,
t.usuario_alteracao,
t.tipo_contato,
t.empresa_antiga,
t.produto,
t.id_filial,
t.id_tp_contrato,
t.vrl_mensal
from bh_cli_profissional_dup t
inner join tmp_cli_dup_faltantes dup on
	dup.id_cliente=t.id_cliente

/*
Atualiza Projetos do cliente
*/
insert into bh_cli_projeto
(
id_cliente,
id_projeto,
dt_criacao,
usuario_criacao
)
select
dup.id_nova,
t.id_projeto,
t.dt_criacao,
t.usuario_criacao
from bh_cli_projeto_dup t
inner join tmp_cli_dup_faltantes dup on
	dup.id_cliente=t.id_cliente

/*
Atualiza Comentario Pre-Entrevista
*/
insert into bh_cli_researcher_obs
(
id_cliente,
obs,
dt_alteracao,
usuario_alteracao
)
select
dup.id_nova,
t.obs,
t.dt_alteracao,
t.usuario_alteracao
from bh_cli_researcher_obs_dup t
inner join tmp_cli_dup_faltantes dup on
	dup.id_cliente=t.id_cliente


/*
Atualiza Status Cliente
*/
insert into bh_cli_status
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
dup.id_nova,
t.id_projeto,
t.id_status,
t.id_substatus,
t.obs,
t.dt_agendada,
t.dt_alteracao,
t.usuario_criacao,
t.hora,
t.entrevistador,
t.follow,
t.exibir,
t.id_motivo
from bh_cli_status_dup t
inner join tmp_cli_dup_faltantes dup on
	dup.id_cliente=t.id_cliente


/*
Atualiza Telefones
*/
insert into bh_cli_telefone
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
dup.id_nova,
t.cod_pais,
t.ddd,
t.telefone,
t.dt_alteracao,
t.usuario_alteracao,
t.tp_telefone,
t.exibir
from bh_cli_telefone_dup t
inner join tmp_cli_dup_faltantes dup on
	dup.id_cliente=t.id_cliente

/*
Atualiza Logs do Cliente
*/
insert into bh_cliente
(
id_cliente,
tp_mudanca,
dt_alteracao,
usuario_alteracao,
tabela_alteracao
)
select
dup.id_nova,
t.tp_mudanca,
t.dt_alteracao,
t.usuario_alteracao,
t.tabela_alteracao
from bh_cliente_dup t
inner join tmp_cli_dup_faltantes dup on
	dup.id_cliente=t.id_cliente
	