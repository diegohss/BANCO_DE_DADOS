use havik

go

SET ARITHABORT OFF
SET ANSI_WARNINGS OFF

(
select
base.usuario_alteracao,
base.id_cliente,
sum(case when base.c_senso>0 then 1 else 0 end)+
sum(case when base.c_eloquencia>0 then 1 else 0 end)+
sum(case when base.c_objetivo>0 then 1 else 0 end)+	     
sum(case when base.c_energia>0 then 1 else 0 end)+
sum(case when base.c_ouvinte>0 then 1 else 0 end)+
sum(case when base.c_mkt>0 then 1 else 0 end)+
sum(case when base.c_credibilidade>0 then 1 else 0 end)+
sum(case when base.c_estruturado>0 then 1  else 0 end) qtd_comunicacao,
sum(case when base.p_inteligencia>0 then 1 else 0 end)+
sum(case when base.p_maturidade>0  then 1 else 0 end)+
sum(case when base.p_visao>0  then 1 else 0 end)+
sum(case when base.p_confianca>0  then 1 else 0 end)+
sum(case when base.p_honestidade>0  then 1 else 0 end)+
sum(case when base.p_punch>0  then 1 else 0 end)+
sum(case when base.p_carisma>0  then 1 else 0 end) qtd_potencial,

cast(cast(sum(isnull(base.c_senso,0) + isnull(base.c_eloquencia,0) + isnull(base.c_objetivo,0) +
isnull(base.c_energia,0) + isnull(base.c_ouvinte,0) + isnull(base.c_mkt,0) + 
isnull(base.c_credibilidade,0) + isnull(base.c_estruturado,0)) as decimal(10,2))
/ cast(8*COUNT(base.id_cliente) as decimal(10,2)) as decimal(10,2)) media_comunicacao,

cast(cast(sum(isnull(base.p_inteligencia,0) + isnull(base.p_maturidade,0) + isnull(base.p_visao,0) + 
isnull(base.p_confianca,0) + isnull(base.p_honestidade,0) + isnull(base.p_punch,0) + isnull(base.p_carisma,0)) as decimal(10,2)) 
/ cast(7*COUNT(base.id_cliente) as decimal(10,2)) as decimal(10,2)) media_potencial

from bc_cli_researcher base

group by 
base.usuario_alteracao,
base.id_cliente
)pre