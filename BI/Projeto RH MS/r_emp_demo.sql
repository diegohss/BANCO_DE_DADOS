/*
Tabela r_emp_demo
employee_id	Cod Candidato
emp_dgr_type_id	Cod Tipo Graduação
emp_edu_id	Cod Escolaridade
emp_mrtl_sts_id	Cod Estado Civil
emp_ntnlty_id	Cod Nacionalidade
emp_age_rng_id	Cod Faixa Idade
emp_gender_id	Cod Sexo
emp_ethn_id	Cod Etnia
*/
-- r_emp_demo
-- drop table bi_kivah.dbo.r_emp_demo
select distinct base.id employee_id,
       acad.id_graduacao emp_dgr_type_id,
       acad.id_escolaridade emp_edu_id,
       base.id_estado_civil emp_mrtl_sts_id,
       base.id_pais emp_ntnlty_id,
       CAST(null as int) cod_emp_age_rng_id,
       base.id_sexo emp_gender_id,
       0 emp_ethn_id
into bi_kivah.dbo.r_emp_demo
from havik.dbo.bc_cliente base

left join
(select ult.id_cliente,ult.id_escolaridade,ult.id_graduacao
from(select id_cliente, MAX(id) id
from havik.dbo.bh_cli_academico
where exibir=1
group by id_cliente
) t
left join havik.dbo.bh_cli_academico ult on
	ult.id=t.id
)acad on
	acad.id_cliente=base.id
	
where base.id is not null