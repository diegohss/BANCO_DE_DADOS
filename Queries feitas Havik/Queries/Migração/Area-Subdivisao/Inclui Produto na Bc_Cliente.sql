alter table bc_cliente
add produto bigint null

go

update bc_cliente
set bc_cliente.produto=c.produto_idProduto
from candidato c
where c.idCandidato=bc_cliente.id