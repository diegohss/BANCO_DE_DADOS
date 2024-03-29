--drop table bc_cli_consultor
create table bc_cli_consultor
(
id bigint not null identity(1,1) primary key,
id_cliente bigint NOT NULL foreign key references bc_cliente(id),
a_senso int null,
a_saudacao int null,
a_impressao int null,
a_levantou int null,
a_profissionalismo int null,
c_senso int null,
c_eloquencia int null,
c_objetivo int null,
c_energia int null,
c_ouvinte int null,
c_mkt int null,
c_credibilidade int null,
c_estruturado int null,
p_inteligencia int null,
p_maturidade int null,
p_visao int null,
p_confianca int null,
p_honestidade int null,
p_punch int null,
p_carisma int null,
salario money null,
movimento bigint null foreign key references br_cli_drive(id),
mudanca bit null,
usuario_alteracao int not null,
dt_alteracao datetime not null
)