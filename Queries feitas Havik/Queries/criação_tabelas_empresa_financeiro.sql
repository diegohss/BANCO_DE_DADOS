create table bc_emp_financeiro
(
id bigint identity(1,1) not null primary key,
id_empresa bigint not null foreign key references bc_empresa_unq(id),
keyaccount int not null foreign key references bc_usuario(id), 
sucesso money null, 
retainer money null,
parcela_1 money null, 
parcela_2 money null,
parcela_3 money null,
modo_pagamento bigint null foreign key references br_modo_pagamento(id),
vencimento bigint null foreign key references br_dias(id), 
dt_alteracao datetime not null,
usuario_alteracao smallint not null 
)

go

create table bh_emp_fin_impostos
(
id bigint identity(1,1) not null primary key,
id_empresa bigint not null foreign key references bc_empresa_unq(id),
id_imposto bigint not null foreign key references br_impostos(id),
dt_alteracao datetime not null,
usuario_alteracao smallint not null 
)

go

create table bh_emp_fin_particularidades
(
id bigint identity(1,1) not null primary key,
id_empresa bigint not null foreign key references bc_empresa_unq(id),
particularidade varchar(500),
dt_alteracao datetime not null,
usuario_alteracao smallint not null 
)

go