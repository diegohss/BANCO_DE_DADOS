select base.id_projeto,
	   sum(case when base.acao in (3,4) then base.valor_total
	   else 
	   (base.valor_total-base.acumulado)
	   end) forecast,
	   base.fee,
	   base.valor_total,
	   acao.descricao acao
from (
select b.id_projeto,max(b.id) id
from bh_proj_financeiro b
--where b.faturar=1
group by b.id_projeto
)b

left join bh_proj_financeiro base on
	base.id=b.id
	
left join br_acao acao on
	acao.id=base.acao
group by base.id_projeto,base.fee,base.valor_total,acao.descricao