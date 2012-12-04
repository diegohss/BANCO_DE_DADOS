-- Eliminação de Duplicidades
-- Com base em duas IDs sendo uma na qual a informação será unificada e outra a que será deletada
-- Unificar os dados da informação a ser deletada na que ficará com a informação.

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
