create view vw_emp_modo_pagamento
as
select top 500 id, descricao 
from br_modo_pagamento
order by descricao

go

create view vw_proj_modo_pagamento
as
select top 500 id, descricao 
from br_modo_pagamento
order by descricao

go

create view vw_cli_modo_pagamento
as
select top 500 id, descricao 
from br_modo_pagamento
order by descricao

go