/*
f_position
job_code_id	Cod Projeto
month_id	Cod Mês
n_rec_resumes	Quantidade de Currículos
n_interviewed	Quantidade de Entrevistados
n_sent_offers	Quantidade de Ofertas Enviadas
n_accptd_offers	Quantidade Ofertas Aceitas
n_rjctd_offers	Quantidade Ofertas Recusadas
*/
-- f_position
-- drop table bi_kivah.dbo.f_position
select distinct base.id job_code_id,
       tempo.anomes month_id,
       cast(COUNT(distinct cli.id_cliente) as float) n_rec_resumes,
       cast(COUNT(distinct ent.id_cliente) as float) n_interviewed,
       cast(count(distinct st.enviada) as float) n_sent_offers,
       cast(count(distinct st.aceitou) as float) n_accptd_offers,
       cast(count(distinct st.rejeitou) as float) n_rjctd_offers
       
into bi_kivah.dbo.f_position
from havik.dbo.bc_projeto base

left join havik.dbo.bh_cli_projeto cli on
	cli.id_projeto=base.id
	
left join havik.dbo.bc_cli_base_cvs cvs on
	cvs.id_cliente=cli.id_cliente
	
left join havik.dbo.bc_cli_consultor ent on
	ent.id_cliente=cli.id_cliente
	
left join 
(
select distinct id_cliente,id_projeto,dt_alteracao,
       case when id_status=6 and id_substatus=30 then
       id_cliente
       else null end enviada,
       case when id_status=6 and id_substatus=21 then
       id_cliente
       else null end rejeitou,       
       case when id_status=7 and id_substatus=32 then
       id_cliente
       else null end aceitou     
                     
from havik.dbo.bh_cli_status 
where exibir=1 and
id_status in (6,7,8) and id_substatus in (30,32,34,21,42)
)st on
	st.id_cliente=cli.id_cliente and
	st.id_projeto=cli.id_projeto
	
left join bi_kivah.dbo.dim_tempo tempo on
	tempo.anomes=convert(char(6),cli.dt_criacao,112) or
	tempo.anomes=convert(char(6),cvs.dt_criacao,112) or
	tempo.anomes=convert(char(6),ent.dt_alteracao,112) or
	tempo.anomes=convert(char(6),st.dt_alteracao,112)

group by base.id,
       tempo.anomes