/*
l_emp_location
emp_location_id	Cod Localização
emp_region_id	Cod Região
emp_location_desc	Descrição Localização
*/
-- l_emp_location
-- drop table bi_kivah.dbo.l_emp_location   
select cast(base.munsinp as smallint) emp_location_id,
       cast(base.UFCOD as int) emp_region_id,
       cast(left(BASE.MUNNOME,30) as char(30)) emp_location_desc
into bi_kivah.dbo.l_emp_location      
from havik.dbo.br_cidades base