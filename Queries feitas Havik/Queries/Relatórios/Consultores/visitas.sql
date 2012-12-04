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

where base.usuario_alteracao not in (35)
	
group by us.nome_usuario,
	   emp.nome,	
	   st.descricao,
	   sub.descricao
	   
	   