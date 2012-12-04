-- Query dos dados de mapeamento

declare @id_projeto int

set @id_projeto=1270

select 
cli.nome nome_cliente,
isnull(emp.nome,prof.empresa_antiga) empresa,
fil.nome filial,
car.descricao cargo,
prof.salario,
prof.bonus,
DATEDIFF(year,cli.dt_nascimento,getdate()) Idade,
esc.descricao escolaridade,
grad.descricao graduacao,
acad.instituicao,
cur.curso certificacoes,
tidi.descricao idioma,
idi.id_nvl_idioma nivel_idioma,
status.status,
status.substatus,
status.dt_alteracao data

from bh_cli_projeto cproj

-- Ultimo Status
left join (
select ult.id,
	   ult.id_projeto,	
	   ult.id_cliente,	
       ult.id_status,
       dsta.descricao status,
       ult.id_substatus,
       dsub.descricao substatus,
       ult.dt_alteracao,
       us.nome_usuario usuario_status    
		
from (select ult.id_cliente,max(ult.id) id
from bh_cli_status ult
where ult.id_projeto=@id_projeto group by ult.id_cliente)ult_st

left join bh_cli_status ult on
	ult.id=ult_st.id

left join br_cli_status dsta on
	dsta.id=ult.id_status
	
left join br_cli_substatus dsub on
	dsub.id=ult.id_substatus
	
left join bc_usuario us on
	us.id=ult.usuario_criacao	
)status on
	status.id_cliente=cproj.id_cliente and
	status.id_projeto=cproj.id_projeto

-- Profissional
left join bh_cli_profissional prof on
	prof.id_cliente=cproj.id_cliente
	
left join bc_empresa_unq emp on
	emp.id=prof.id_empresa
	
left join bc_empresa_filial fil on
	fil.id=prof.id_filial		
	
left join br_cargo car on
	car.id=prof.id_cargo	

-- Parte Academica
left join bh_cli_cursos cur on
	cur.id_cliente=cproj.id_cliente

left join bh_cli_academico acad on
	acad.id_cliente=cproj.id_cliente
	
left join br_graduacao grad on
	grad.id=acad.id_graduacao	
	
left join br_escolaridade esc on
	esc.id=acad.id_escolaridade	
	
left join bh_cli_idiomas idi on
	idi.id_cliente=cproj.id_cliente

left join br_idiomas tidi on		
	tidi.id=idi.id_idioma

-- Parte Cliente
left join bc_cliente cli on
	cli.id=cproj.id_cliente
	
where cproj.id_projeto=@id_projeto

group by
cli.nome,
isnull(emp.nome,prof.empresa_antiga),
fil.nome,
car.descricao,
prof.salario,
prof.bonus,
DATEDIFF(year,cli.dt_nascimento,getdate()),
esc.descricao,
grad.descricao,
acad.instituicao,
cur.curso,
tidi.descricao,
idi.id_nvl_idioma,
status.status,
status.substatus,
status.dt_alteracao