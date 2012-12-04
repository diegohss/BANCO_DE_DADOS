INSERT INTO bi_kivah.dbo.fato_cliente_empresa
(
           cod_tempo
           ,cod_empresa
           ,cod_keyaccount
           ,qtd_ativos
           ,qtd_inativos
           ,qtd_sem_offlimits
           ,qtd_manutencao
           ,qtd_prospeccao
           ,qtd_radar
)
select tempo.cod_tempo,
	   base.id cod_empresa,
	   0 cod_keyaccount,
	   proj.ativo qtd_ativos,
	   proj.inativo qtd_inativos,
	   0 qtd_sem_offlimits,
	   
	   
	   

from havik.dbo.bc_empresa_unq base

left join bi_kivah.dbo.dim_tempo tempo on
	tempo.data=convert(char(10),base.dt_criacao,23)

-- Espaço para o keyaccount


-- Contador com base no Status
left join(
select base.id,
       COUNT(visita.id) visitas,
       COUNT(proposta.id) proposta,
       prop.dt_alteracao dt_proposta,
       vis.dt_alteracao dt_visita

from havik.dbo.bc_empresa_unq base

left join(
select id_empresa,MAX(id) id
from havik.dbo.bh_emp_status
where id_status in (2,3,7)
group by id_empresa
)visita on
 visita.id_empresa=base.id
 
left join(
select id_empresa,MAX(id) id
from havik.dbo.bh_emp_status
where (id_status in (6) or (id_status in (2,3,7) and id_substatus in (9,13)))
group by id_empresa
)proposta on
 proposta.id_empresa=base.id 
 
left join havik.dbo.bh_emp_status vis on
	vis.id=visita.id
	
left join havik.dbo.bh_emp_status prop on
	prop.id=proposta.id

group by base.id,prop.dt_alteracao,vis.dt_alteracao
)status on
	status.id=base.id	
	
left join(
select p.id_empresa,
       sum(case when p.dt_fim is null then
           1 end) ativo,
       sum(case when p.dt_fim is not null then
           1 end) inativo
from havik.dbo.bc_projeto p
group by p.id_empresa
)proj on
	proj.id_empresa=base.id