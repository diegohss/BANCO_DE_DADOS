/*
l_position
tableoid	Padr�o
cmax	Padr�o
xmax	Padr�o
cmin	Padr�o
xmin	Padr�o
oid	Padr�o
ctid	Padr�o
position_id	Cod Cargo
position_desc	Descri��o Cargo
position_desc_sch	Outro modo descri��o
position_desc_tch	Outro modo descri��o
*/
-- l_position
-- drop table bi_kivah.dbo.l_position
select base.id position_id,
       left(base.descricao,30) position_desc,
       '' position_desc_sch,
       '' position_desc_tch
into bi_kivah.dbo.l_position
from havik.dbo.br_cargo base

