alter table bc_empresa_unq ALTER COLUMN cidade nvarchar(6) null
go
ALTER table bc_empresa_unq ADD FOREIGN KEY fk_cidades references br_cidades(muncod)

alter table bc_empresa_unq
ADD CONSTRAINT fk_empresa_cidades
FOREIGN KEY ()
Referências Pessoas(P_ID)


    
    
