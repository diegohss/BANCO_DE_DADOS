CREATE TABLE rh.fato_cliente_empresa(
	cod_tempo int  references rh.dim_tempo(cod_tempo),
	cod_empresa bigint  references rh.dim_empresa(cod_empresa),
	cod_keyaccount int  references rh.dim_usuario(cod_usuario),
	qtd_ativos float NULL,
	qtd_inativos float NULL,
	qtd_sem_offlimits float NULL,
	qtd_manutencao float NULL,
	qtd_prospeccao float NULL,
	qtd_radar float NULL
);
create table rh.fato_rh
(
cod_candidato bigint  references rh.dim_candidato(cod_candidato),
cv int null,
disc int null,
cv_havik int null,
shortlist int null,
banca int null,
res int null,
cbi int null,
game int null,
testes int null,
profissional int null,
codificacao int null,
superior_inc int null,
superior_comp int null,
pos_graduacao int null,
mba int null,
ingles_basico int null,
ingles_avancado int null,
idioma_basico int null,
idioma_avancado int null,
preentrevista int null,
entrevista int null,
projeto int null,
placement int null,
entrevista_cliente int null
);