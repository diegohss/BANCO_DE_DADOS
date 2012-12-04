--drop table bc_cli_researcher
create table bc_cli_researcher
(
id bigint identity(1,1) not null primary key,
id_cliente bigint NOT NULL foreign key references bc_cliente(id),
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