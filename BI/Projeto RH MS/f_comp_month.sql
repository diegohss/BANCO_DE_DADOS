-- f_comp_month
-- DROP TABLE bi_kivah.dbo.f_comp_month;

select base.id employee_id,
       1 comp_type_id ,
       convert(char(6),prof.dt_alteracao,112) month_id,
       cast(prof.salario as float) comp_amt
into bi_kivah.dbo.f_comp_month
from havik.dbo.bc_cliente base

left join havik.dbo.bh_cli_profissional prof on
	prof.id_cliente=base.id
	
where base.id is not null
	
--convert(char(6),ultcod.dt_alteracao,112)	