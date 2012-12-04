create table rh.fato_financeiro
(
cod_tempo int  references rh.dim_tempo(cod_tempo),
cod_financeiro bigint  references rh.dim_financeiro(cod_financeiro),
cod_usuario int  references rh.dim_usuario(cod_usuario),
cod_projeto bigint  references rh.dim_projeto(cod_projeto),
cod_status int  references rh.dim_status_financeiro(cod_status),
cod_produto int  references rh.dim_produto(cod_produto),
soma_forecast money null,
soma_faturamento money null,
meta_faturamento money null
);
create table rh.fato_projeto
(
cod_tempo int  references rh.dim_tempo(cod_tempo),
cod_projeto bigint  references rh.dim_projeto(cod_projeto),
cod_codificacao int  references rh.dim_codificacao(cod_codificacao),
cod_cargo int  references rh.dim_cargo(cod_cargo),
cod_produto int  references rh.dim_produto(cod_produto),
qtd_candidatos float null,
qtd_projetos float null, 
qtd_preentrevistas float null,
qtd_entrevistas float null,
qtd_cvs float null,
media_salarial money null,
media_prazo_entrega float null,
qtd_ativos float null
);
create table rh.fato_candidato
(
cod_tempo int  references rh.dim_tempo(cod_tempo),
cod_candidato bigint  references rh.dim_candidato(cod_candidato),
cod_codificacao int  references rh.dim_codificacao(cod_codificacao),
cod_cargo int  references rh.dim_cargo(cod_cargo),
qtd_candidatos float null,
qtd_projetos float null, 
qtd_preentrevistas float null,
qtd_entrevistas float null,
qtd_cvs float null,
media_salarial money null
);
create table rh.fato_status_empresa
(
cod_tempo int  references rh.dim_tempo(cod_tempo),
cod_empresa bigint  references rh.dim_empresa(cod_empresa),
cod_usuario int  references rh.dim_usuario(cod_usuario),
cod_status int  references rh.dim_status_empresa(cod_status),
qtd_status float null,
meta_status float null
);
create table rh.fato_status_projeto
(
cod_tempo int  references rh.dim_tempo(cod_tempo),
cod_projeto bigint  references rh.dim_projeto(cod_projeto),
cod_usuario int  references rh.dim_usuario(cod_usuario),
cod_status int  references rh.dim_status_projeto(cod_status),
cod_produto int  references rh.dim_produto(cod_produto),
qtd_status float null,
meta_status float null
);
create table rh.fato_status_candidato
(
cod_tempo int  references rh.dim_tempo(cod_tempo),
cod_usuario int  references rh.dim_usuario(cod_usuario),
cod_status int  references rh.dim_status_projeto(cod_status),
qtd_status float null,
qtd_candidatos float null,
meta_status float null
);