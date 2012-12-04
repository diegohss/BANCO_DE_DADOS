use kivah
go
select base.nome, usuario_alteracao, ultimo_status, ultimo_substatus, sta.id_projeto,
sta.id_status, sta.id_substatus, sta.dt_agendada, sta.dt_alteracao 
from bc_cliente base 

left join bh_cli_status sta
on base.id = sta.id_cliente

where nome = 'Daniel da Silva Franco'
