select MONTH(base.dt_alteracao) mes,COUNT(distinct base.id_cliente) qtd_impactados
from bh_cli_status base
where convert(char(10),base.dt_alteracao,23) between '2012-03-01' and '2012-05-31'
group by MONTH(base.dt_alteracao)