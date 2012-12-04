/*
Candidatos com a seguinte característica
1)	 Área tecnologia
2)	Relatório com todos os candidatos as seguintes colunas
a.	Id
b.	Nome
c.	Idade
d.	Cargo
e.	Projeto-ultimo OU NENHUM SE NÃO FOI ALOCADO EM NENHUM PROJETO
f.	Status e substatus(ultimo)
g.	Formação (última-curso e faculdade)
h.	Especialização-ULTIMA
i.	Preentrevista( ultima)
j.	Entrevista(ultima)
*/
use havik
go

select base.id id_candidato,
	   base.nome,
   	   year(getdate()) - year(base.dt_nascimento)- 
	   case 
			 when month(getdate()) < month(base.dt_nascimento) then 1
			 when month(getdate()) = month(base.dt_nascimento) and 
			 day(getdate()) < day(base.dt_nascimento) then 1
			 else 0
       end Idade,
       prof.cargo,
       isnull(proj.projeto,'nenhum') projeto,
       status.status,
       status.substatus,
       acad.graduacao curso,
       acad.instituicao faculdade,
       esp.curso especialidade,       
       pre.obs pre_entrevista,
       ent.obs entrevista       
       

from bc_cliente base

-- Profissional
left join(
select ult.id,
	   ult.id_cliente,
	   ult.id_empresa,
	   emp.nome empresa,
	   ult.empresa_antiga,
	   fil.nome filial,
	   ult.id_cargo,
	   cargo.descricao cargo,
	   convert(decimal(10),ult.salario) salario,
	   ult.bonus,  
	   ult.dt_inicio,
	   ult.dt_saida,
	   ult.usuario_alteracao,
	   ult.tipo_contato

from (
SELECT a.id
FROM bh_cli_profissional a
WHERE a.ID IN
(SELECT TOP 1 b.id FROM bh_cli_profissional b WHERE b.id_cliente = a.id_cliente ORDER BY b.dt_inicio DESC)
)ult_prof

left join bh_cli_profissional ult on
	ult.id=ult_prof.id
	
left join br_cargo cargo on
	cargo.id=ult.id_cargo
	
left join bc_empresa_unq emp on
	emp.id=ult.id_empresa		
	
left join bc_empresa_filial fil on
	fil.id=ult.id_filial		
		
)prof on
	prof.id_cliente=base.id
	
-- Academico	
left join (
select distinct ult.id_cliente,
	   ult.id_graduacao,
	   grad.descricao graduacao,
	   ult.instituicao
from (
select ult_acad.id_cliente,max(ult_acad.id) id
from bh_cli_academico ult_acad
group by ult_acad.id_cliente
)ult_acad
left join bh_cli_academico ult on	
	ult.id=ult_acad.id
left join br_graduacao grad on
	grad.id=ult.id_graduacao		
)acad on
	acad.id_cliente=base.id	
	
-- Ultimo Projeto
left join(
select ult.id_cliente,
       ult.id_projeto,
       pr.nome projeto
from(select id_cliente,MAX(id) id
from bh_cli_projeto
group by id_cliente)t
left join bh_cli_projeto ult on
	ult.id=t.id
left join bc_projeto pr on
	pr.id=ult.id_projeto	
)proj on
	proj.id_cliente=base.id
	
-- Ultimo Status
left join (
select ult.id,
	   ult.id_projeto,	
	   ult.id_cliente,	
       ult.id_status,
       dsta.descricao status,
       ult.id_substatus,
       dsub.descricao substatus,
       ult.dt_alteracao
		
from (select id_cliente,max(id) id
from bh_cli_status 
where exibir=1 and id_cliente in
(
select prt.id_cliente
from(select id_cliente,MAX(id) id
from bh_cli_projeto
group by id_cliente)tt
left join bh_cli_projeto prt on
	prt.id=tt.id
)
group by id_cliente)ult_st

left join bh_cli_status ult on
	ult.id=ult_st.id

left join br_cli_status dsta on
	dsta.id=ult.id_status
	
left join br_cli_substatus dsub on
	dsub.id=ult.id_substatus
	
)status on
	status.id_cliente=base.id 
	
-- Ultima Pré-Entrevista

left join(
select ult.id,
	   ult.id_cliente,	 
	   ult.usuario_alteracao,
	   ult.dt_alteracao,
	   ult.obs
from (
select id_cliente,max(id) id
from bh_cli_researcher_obs
group by id_cliente
)t
left join bh_cli_researcher_obs ult on
	ult.id=t.id
)pre on 
	pre.id_cliente=base.id	
	
-- Ultima Entrevista

left join(
select ult.id,
	   ult.id_cliente,	 
	   ult.usuario_alteracao,
	   ult.dt_alteracao,
	   ult.obs
from (
select id_cliente,max(id) id
from bh_cli_consultor_obs ult_e
group by id_cliente
)t
left join bh_cli_consultor_obs ult on
	ult.id=t.id
)ent on 
	ent.id_cliente=base.id
	
-- Especialização / Cursos

left join (
select ult.id_cliente,
	   ult.curso,
	   ult.dt_criacao
from(select id_cliente,MAX(id) id
from bh_cli_cursos
where exibir=1
group by id_cliente
)t
left join bh_cli_cursos ult on
	ult.id=t.id
)esp on
	esp.id_cliente=base.id
	
left join bh_cli_codifica codi on
	codi.id_cliente=base.id
	
where codi.id_area=7		