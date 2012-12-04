use bi_kivah
go
create table fato_rh
(
cod_candidato bigint foreign key references dim_candidato(cod_candidato),
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
)
go

create table dim_codi_candidato
(
cod_candidato bigint foreign key references dim_candidato(cod_candidato),
cod_codificacao int NULL,
area varchar(100) NULL,
subdivisao varchar(100) NULL,
segmento varchar(100) NULL
)