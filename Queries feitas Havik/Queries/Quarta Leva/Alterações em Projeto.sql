
alter table bc_projeto
add grau_dificuldade tinyint null

go

alter table bc_projeto
add dt_prev_shortlist date null

go

alter table bc_projeto
add dt_ent_shortlist date null

go

alter table bc_projeto
add dt_ini_busca date null

go

alter table bc_projeto
add qtd_cand_shortlist tinyint null

go


create table br_grau_dificuldade
(
id int null,
descricao varchar(50),
fator decimal(10,2),
usuario_criacao int,
data_criacao datetime
)

go


create view vw_proj_grau_dificuldade
as
select id, descricao
from br_proj_grau_dificuldade

