/*
employee_id	Cod Candidato	
emp_fte_coef	??	
rcrtng_source_id	Cod Tipo_Recrutamento	
emp_curr_sts_id	Cod Status Atual	Ativo/Inativo
emp_level_id	Cod Nível Cargo	Se o cargo é de Gerente, Executivo, Associado
emp_location_id	Cod Localidade	Estado/Cidade
emp_imm_sts_id	Cod Status Imigração	Não temos nada parecido
emp_clearance_id	Cod Classificação do Empregado	Usar o último segmento do candidato?
emp_mnrty_grp_id	Cod Grupo Minoria	Semelhante Etnia
emp_title_id	Cod Contratante	Colocar quem abordou primeiro o candidato ou quem era o responsavel do projeto
employee_desc	Nome Candidato	
emp_pstn_sts_id	Cod Jornada Trabalho	Integral ou Meio Periodo … Podemos adaptar para modelo de contrato
emp_dptm_id	Cod Departamento	Area-Subdivisao ou Area
hire_date	Data Contratação	
emp_birth_date	Data Nascimento	
emp_id_n	??	
emp_work_exp	Tempo Experiência	
leave_date	Data Saida	
leave_rsn_id	Motivo Saida	
supervisor_id	Cod Supervisor	
exempt_flg	??	
*/
-- l_employee
-- drop table bi_kivah.dbo.l_employee
select distinct base.id employee_id,
	   CAST(null as float) emp_fte_coef,
	   1 rcrtng_source_id,
	   1 emp_curr_sts_id,
	   prof.id_cargo emp_level_id,
	   cast(cid.munsinp as int) emp_location_id,
	   --base.id_cidade emp_location_id,
	   CAST(null as int) emp_imm_sts_id,
	   prof.id_segmento emp_clearance_id,
	   CAST(null as int) emp_mnrty_grp_id,
	   base.usuario_alteracao emp_title_id,
	   ltrim(rtrim(cast(left(base.nome,30) as CHAR(30)))) employee_desc,
	   prof.tipo_contato emp_pstn_sts_id,
	   prof.id_area emp_dptm_id,
	   prof.dt_inicio hire_date,
	   cast(base.dt_nascimento as datetime) emp_birth_date,
	   base.id emp_id_n,
	   CAST(null as int) emp_work_exp,
	   prof.dt_saida leave_date,
	   CAST(null as int) leave_rsn_id,
	   CAST(2 as int) supervisor_id,
	   CAST(null as float) exempt_flg
into bi_kivah.dbo.l_employee
from havik.dbo.bc_cliente base

--Profissional
left join (
select ult.id_cliente,
	   ult.id_empresa,
	   emp.nome empresa,
	   ult.empresa_antiga,
	   fil.nome filial,
	   ult.dt_inicio,
	   ult.dt_saida,
	   ult.id_cargo,
	   cargo.descricao cargo,
	   ult.salario,
	   ult.bonus,
	   ult.tipo_contato,	   
	   ult.id_segmento,
	   seg.descricao segmento,
	   ult.id_area,
	   area.descricao area,
	   ult.id_subdivisao,
	   sub.descricao subdivisao
from (
SELECT a.id
FROM havik.dbo.bh_cli_profissional a
WHERE a.ID IN
(SELECT TOP 1 b.id FROM havik.dbo.bh_cli_profissional b WHERE b.id_cliente = a.id_cliente ORDER BY b.dt_inicio DESC)
)ult_prof
left join havik.dbo.bh_cli_profissional ult on
	ult.id=ult_prof.id	
left join havik.dbo.br_area area on
	area.id=ult.id_area	
left join havik.dbo.br_cargo cargo on
	cargo.id=ult.id_cargo	
left join havik.dbo.br_subdivisao sub on
	sub.id=ult.id_subdivisao	
left join havik.dbo.br_segmento seg on
	seg.id=ult.id_segmento
left join havik.dbo.bc_empresa_filial fil on
	fil.id=ult.id_filial		
left join havik.dbo.bc_empresa_unq emp on
	emp.id=ult.id_empresa	
)prof on
	prof.id_cliente=base.id

left join havik.dbo.br_cidades cid on
		cid.muncod=base.id_cidade

where base.id is not null