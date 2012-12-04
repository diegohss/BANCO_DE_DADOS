use havik
go

alter procedure [dbo].[sp_relat_contatos_anl]
(
@projetos int_list readonly,
@status int_list readonly,
@substatus int_list readonly,
@empresas int_list readonly,
@captacao int = null,
@entrega int = null,
@colab int = null,
@dt_ini datetime = null,
@dt_fim datetime = null,  
@pre int = null,
@colaborador int = null,
@tipo_relat int = null,
@usuario int = null
)
as
begin
select us.nome_usuario usuario_criacao ,status.id_cliente,
	   convert(char(10),status.dt_alteracao,23) dt_alteracao,
       case when count(distinct nota.id_cliente)>=1 then
       'Possui'
       else 'Não Possui'
       end Nota,
       case when count(distinct obs.id_cliente)>=1 then
       'Possui'
       else 'Não Possui'
       end Observacao,
       case when count(distinct acad.id_cliente)>=1 then
       'Possui'
       else 'Não Possui'
       end Academico,
       case when count(distinct prof.id_cliente)>=1 then
       'Possui'
       else 'Não Possui'
       end Profissional
       
from -- Ultimo Status
(
select distinct 
	ult.usuario_criacao,
	ult.id_cliente,
	ult.id_status,
	st.descricao status,
	ult.id_substatus,
	sub.descricao substatus,
	ult.id_projeto,
	ult.dt_alteracao
		
from (select st.id_cliente,max(st.id) id
from bh_cli_status st
where ((st.id_status=2 and st.id_substatus=13 and st.exibir=1) or 
(st.id_status=2 and st.id_substatus=11 and st.exibir=1) or
(st.id_status=2 and st.id_substatus=10 and st.exibir=1) or
(st.id_status=2 and st.id_substatus=45 and st.exibir=1) or
(st.id_status=2 and st.id_substatus=37 and st.exibir=1) or
(st.id_status=2 and st.id_substatus=46 and st.exibir=1))
group by st.id_cliente)ult_st

left join bh_cli_status ult on
	ult.id=ult_st.id

left join br_cli_status st on
	st.id=ult.id_status		

left join br_cli_substatus sub on
	sub.id=ult.id_substatus	
	
where convert(char(10),ult.dt_alteracao,23) between	convert(char(10),@dt_ini,23) and convert(char(10),@dt_fim,23) 	
			
)status 

left join bc_cli_researcher nota on
	nota.id_cliente=status.id_cliente and
	nota.usuario_alteracao=status.usuario_criacao
	
left join bh_cli_researcher_obs obs on
	obs.id_cliente=status.id_cliente and
	obs.usuario_alteracao=status.usuario_criacao
	
-- Profissional
left join(
select ult.id,
	   ult.id_cliente,
	   ult.id_empresa,
	   emp.nome empresa,
	   ult.empresa_antiga,
	   ult.dt_inicio,
	   ult.dt_saida,
	   ult.id_cargo,
	   cargo.descricao cargo,
	   convert(decimal(10),ult.salario) salario,  
	   ult.usuario_alteracao,
	   ult.tipo_contato,
	   ult.dt_alteracao
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

where (ult.empresa_antiga is not null or ult.id_empresa is not null) and 
(ult.dt_inicio is not null and ult.dt_inicio<>'1900-01-01 00:00:00.000')
	
)prof on
	prof.id_cliente=status.id_cliente
	
-- Academico	
left join (
select ult.id_cliente,
	   ult.id_graduacao,
	   grad.descricao graduacao,
	   ult.id_escolaridade,
	   esc.descricao escolaridade
from (
select ult_acad.id_cliente,max(ult_acad.id) id
from bh_cli_academico ult_acad
group by ult_acad.id_cliente
)ult_acad
left join bh_cli_academico ult on	
	ult.id=ult_acad.id and
	ult.id_cliente=ult_acad.id_cliente	
left join br_graduacao grad on
	grad.id=ult.id_graduacao
left join br_escolaridade esc on
	esc.id=ult.id_escolaridade	
where ult.instituicao is not null and ult.id_graduacao is not null	
)acad on 
	acad.id_cliente=status.id_cliente	
	
left join bc_usuario us on
	us.id=status.usuario_criacao	

where (convert(char(10),nota.dt_alteracao,23) between 
convert(char(10),dateadd(day,-30,status.dt_alteracao),23) and convert(char(10),dateadd(day,30,status.dt_alteracao),23))
and
(convert(char(10),obs.dt_alteracao,23) between 
convert(char(10),dateadd(day,-30,status.dt_alteracao),23) and convert(char(10),dateadd(day,30,status.dt_alteracao),23))
and 
(status.usuario_criacao=@colaborador or @colaborador is null)

group by us.nome_usuario,status.id_cliente,status.dt_alteracao

end