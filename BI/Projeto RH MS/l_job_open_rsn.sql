/*
l_job_open_rsn
job_open_rsn_id	Cod Motivo Abertura
job_open_rsn_desc	Descrição Motivo Abertura
job_open_rsn_desc_sch	Outro modo descrição
job_open_rsn_desc_tch	Outro modo descrição
*/
-- l_job_open_rsn
-- drop table bi_kivah.dbo.l_job_open_rsn
select base.id job_open_rsn_id,
       left(base.descricao,30) job_open_rsn_desc,
       '' job_open_rsn_desc_sch,
       '' job_open_rsn_desc_tch
into bi_kivah.dbo.l_job_open_rsn
from havik.dbo.br_tp_produto base