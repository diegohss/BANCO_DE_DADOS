/*
l_position
tableoid	Padrão
cmax	Padrão
xmax	Padrão
cmin	Padrão
xmin	Padrão
oid	Padrão
ctid	Padrão
position_id	Cod Cargo
position_desc	Descrição Cargo
position_desc_sch	Outro modo descrição
position_desc_tch	Outro modo descrição
*/
-- l_position
-- drop table bi_kivah.dbo.l_position
select base.id position_id,
       left(base.descricao,30) position_desc,
       '' position_desc_sch,
       '' position_desc_tch
into bi_kivah.dbo.l_position
from havik.dbo.br_cargo base

