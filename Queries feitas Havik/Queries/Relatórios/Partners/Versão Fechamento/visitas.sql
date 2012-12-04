use havik
go
select us.nome_usuario,
	   emp.nome empresa,	
	   st.descricao status,
	   sub.descricao substatus,
	   COUNT(base.id) qtd_status

from bh_emp_status base

left join br_emp_status st on
	st.id=base.id_status
	
left join br_emp_substatus sub on
	sub.id=base.id_substatus	
	
left join bc_usuario us on
	us.id=base.usuario_alteracao

left join bc_empresa_unq emp on
	emp.id=base.id_empresa	

where base.usuario_alteracao not in (35) and 
	  convert(char(10),base.dt_alteracao,23) between '2012-06-01' and '2012-06-07' and
	  us.cargo in ('partner','consultor','r2') and base.id_status=2
	
group by us.nome_usuario,
	   emp.nome,	
	   st.descricao,
	   sub.descricao
	   
	   