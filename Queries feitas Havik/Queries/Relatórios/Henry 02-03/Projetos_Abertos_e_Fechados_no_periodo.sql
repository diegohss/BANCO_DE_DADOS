/*
Todas os Projetos em Aberto onde o Henry é o Responsavel da Entrega
- Cod Projeto
- Nome Projeto
- Consultor (Colab. Responsavel)
- Dt Criação Projeto
- Dias em Aberto
- Candidatos linkados a vaga (count ou todos)
- Candidatos Enviados (short list enviado ... count ou todos) (3-18)

Email e Nome de todos com ddd 21 e classificamos como Segmento - Banking / Area - Comercial
*/
use havik
go
select base.id id_projeto,
	   base.nome projeto,
	   rent.nome_usuario resp_entrega,
	   col.nome_usuario colab_responsavel,
	   rcap.nome_usuario resp_captacao,
	   base.cod_do_vagas,
	   base.requisicao_vagas,
	   place.nome nome_placement,
	   convert(char(10),base.dt_criacao,23) data_criacao,
	   case when base.dt_fim is null then
	   DATEDIFF(day,base.dt_criacao,getdate()) 
	   else 
	   ''
	   end dias_em_aberto,
	   convert(char(10),base.dt_fim,23) data_fim,
	   DATEDIFF(day,base.dt_criacao,base.dt_fim) duracao_projeto,
	   proj.qtd_clientes linkados_vaga,
	   COUNT(st.id_cliente) candidatos_enviados  
	   	
from bc_projeto base

left join (select id_projeto, count(id_cliente) qtd_clientes from bh_cli_projeto 
		   group by id_projeto)proj on
	proj.id_projeto=base.id
	
left join (select id_projeto,id_cliente from bh_cli_status st where
	st.id_status=3 and
	st.id_substatus=18 and
	st.exibir=1	
	group by id_projeto,id_cliente)st on
	st.id_projeto=base.id
	
left join(select 
	 ult.id_projeto,  	
	 ult.id_cliente,
	 cli.nome
	   
from (select st.id_cliente,MAX(st.id) id 
from bh_cli_status st
where st.id_status=7 and st.id_substatus=32 and st.exibir=1
group by st.id_cliente) ult_st

left join bh_cli_status ult on
	ult.id=ult_st.id
	
left join bc_cliente cli on
	cli.id=ult.id_cliente
)place on
	place.id_projeto=base.id		
	
left join bc_usuario rent on
	rent.id=base.responsavel_entrega
	
left join bc_usuario col on
	col.id=base.colaborador_responsavel
	
left join bc_usuario rcap on
	rcap.id=base.responsavel_captacao		
	
left join br_tp_produto prod on
	prod.id=base.tipo_produto	
	
where base.responsavel_captacao=3 and
	  convert(char(10),base.dt_fim,23)>='2012-01-01'

group by 
	   base.id,
	   base.nome,
	   rent.nome_usuario,
	   col.nome_usuario,
	   rcap.nome_usuario,
	   base.cod_do_vagas,
	   base.requisicao_vagas,	   
	   place.nome,
	   base.dt_criacao,
	   base.dt_fim,
	   proj.qtd_clientes
	   