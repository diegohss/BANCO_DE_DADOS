create procedure sp_teste_insert
(
@cnpj varchar(14),
@razao_social varchar(100),
@nome varchar(100),
@segmento bigint,
@endereco varchar(200)
)	
as

begin 

insert into bc_empresa_unq 
(
cnpj,
razao_social,
nome,
segmento,
endereco
)
values
(
@cnpj,
@razao_social,
@nome,
@segmento,
@endereco
)

end