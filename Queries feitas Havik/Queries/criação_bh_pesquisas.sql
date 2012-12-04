create table bh_pesquisas
(
id bigint not null identity (1,1) primary key,
consulta varchar(4000) null,
modulo varchar(50) null,
tipo varchar(3) null,
usuario int not null
)

