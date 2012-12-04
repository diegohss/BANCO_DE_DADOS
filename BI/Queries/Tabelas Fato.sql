use bi_kivah
go
create table fato_financeiro
(
cod_tempo int foreign key references dim_tempo(cod_tempo),
cod_financeiro bigint foreign key references dim_financeiro(cod_financeiro),
cod_usuario int foreign key references dim_usuario(cod_usuario),
cod_projeto bigint foreign key references dim_projeto(cod_projeto),
cod_status int foreign key references dim_status_financeiro(cod_status),
cod_produto int foreign key references dim_produto(cod_produto),
soma_forecast money null,
soma_faturamento money null,
meta_faturamento money null
)
go
create table fato_projeto
(
cod_tempo int foreign key references dim_tempo(cod_tempo),
cod_projeto bigint foreign key references dim_projeto(cod_projeto),
cod_codificacao int foreign key references dim_codificacao(cod_codificacao),
cod_cargo int foreign key references dim_cargo(cod_cargo),
cod_produto int foreign key references dim_produto(cod_produto),
qtd_candidatos float null,
qtd_projetos float null, 
qtd_preentrevistas float null,
qtd_entrevistas float null,
qtd_cvs float null,
media_salarial money null,
media_prazo_entrega float null,
qtd_ativos float null
)
go
create table fato_candidato
(
cod_tempo int foreign key references dim_tempo(cod_tempo),
cod_candidato bigint foreign key references dim_candidato(cod_candidato),
cod_codificacao int foreign key references dim_codificacao(cod_codificacao),
cod_cargo int foreign key references dim_cargo(cod_cargo),
qtd_candidatos float null,
qtd_projetos float null, 
qtd_preentrevistas float null,
qtd_entrevistas float null,
qtd_cvs float null,
media_salarial money null
)
go
create table fato_status_empresa
(
cod_tempo int foreign key references dim_tempo(cod_tempo),
cod_empresa bigint foreign key references dim_empresa(cod_empresa),
cod_usuario int foreign key references dim_usuario(cod_usuario),
cod_status int foreign key references dim_status_empresa(cod_status),
qtd_status float null,
meta_status float null
)
go
create table fato_status_projeto
(
cod_tempo int foreign key references dim_tempo(cod_tempo),
cod_projeto bigint foreign key references dim_projeto(cod_projeto),
cod_usuario int foreign key references dim_usuario(cod_usuario),
cod_status int foreign key references dim_status_projeto(cod_status),
cod_produto int foreign key references dim_produto(cod_produto),
qtd_status float null,
meta_status float null
)
go
create table fato_status_candidato
(
cod_tempo int foreign key references dim_tempo(cod_tempo),
cod_usuario int foreign key references dim_usuario(cod_usuario),
cod_status int foreign key references dim_status_projeto(cod_status),
qtd_status float null,
qtd_candidatos float null,
meta_status float null
)
go