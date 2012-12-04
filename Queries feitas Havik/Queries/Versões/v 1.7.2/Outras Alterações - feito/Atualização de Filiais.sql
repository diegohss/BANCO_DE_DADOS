use havik
go

update fil
set fil.codigo=base.codigo

from tb_filiais base

inner join bc_empresa_filial fil on
	fil.id=base.id