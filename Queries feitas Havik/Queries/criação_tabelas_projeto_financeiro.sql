create table bc_proj_financeiro
(
id bigint identity(1,1) not null primary key,
id_projeto bigint not null foreign key references bc_projeto(id),
id_candidato bigint null foreign key references bc_empresa_unq(id),
email_fatura varchar(200) null,
particularidade varchar(500) null,
keyaccount int not null foreign key references bc_usuario(id), 
sucesso money null, 
retainer money null,
parcela_1 money null, 
parcela_2 money null,
parcela_3 money null,
modo_pagamento bigint null foreign key references br_modo_pagamento(id),
vencimento bigint null foreign key references br_dias(id),
fee money null,
imposto bit null,
salario_ini money null,
salario_fim money null,
dt_alteracao datetime not null,
usuario_alteracao smallint not null 
)

go

create table bh_proj_fin_despesas
(
id bigint identity(1,1) not null primary key,
id_projeto bigint not null foreign key references bc_projeto(id),
id_despesa bigint not null foreign key references br_tp_despesas(id),
dt_alteracao datetime not null,
usuario_alteracao smallint not null 
)

go


