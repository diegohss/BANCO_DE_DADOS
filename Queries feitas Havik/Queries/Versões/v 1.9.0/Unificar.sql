-- Elimina��o de Duplicidades
-- Com base em duas IDs sendo uma na qual a informa��o ser� unificada e outra a que ser� deletada
-- Unificar os dados da informa��o a ser deletada na que ficar� com a informa��o.

use havik
go

begin

declare @id_final int
declare @id_uni int

set @id_final=1
set @id_uni=2

select *
from bc_cliente
where id in (@id_final,@id_uni)

end
