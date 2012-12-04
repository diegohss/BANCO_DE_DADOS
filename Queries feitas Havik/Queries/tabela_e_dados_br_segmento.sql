create table br_segmento 
(
id bigint identity(1,1) not null primary key ,
descricao varchar(100) null,
usuario_criacao smallint not null,
dt_criacao datetime not null
);


insert into br_segmento(descricao,usuario_criacao,dt_criacao)
values
('Banking','1',GETDATE()),
('Insurance','1',GETDATE()),
('Cards','1',GETDATE()),
('Credit Bureau','1',GETDATE()),
('Other Industries (Telecom/Retail/Services and others)','1',GETDATE()),
('','1',GETDATE())
