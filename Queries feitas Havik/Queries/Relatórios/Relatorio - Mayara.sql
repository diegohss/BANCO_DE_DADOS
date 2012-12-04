-- Dezembro/11, Janeiro/12, Fevereiro/12

/*
- Cód Projeto, Projeto, Resp. Captação, Resp. Entrega, Nome Candidato Placement, Empresa do Projeto
*/

use havik
go

select distinct base.id id_projeto,	   
	   base.nome  projeto,
	   cap.nome_usuario resp_captacao,
	   ent.nome_usuario resp_entrega,
	   cli.nome candidato,
	   date=dbo.fn_dateformat(clis.dt_alteracao,1),
	   CAST(cast(MONTH(clis.dt_alteracao) as varchar(2)) + '/' + 
	   cast(YEAR(clis.dt_alteracao) as varchar(4)) as varchar(20)) mes_ano,
	   emp.nome empresa
	   
from bc_projeto base

left join bh_proj_status projs on
	projs.id_projeto=base.id

left join bc_empresa_unq emp on
	emp.id=base.id_empresa

left join bh_cli_projeto cliproj on
	cliproj.id_projeto=base.id

left join bh_cli_status clis on
	clis.id_projeto=base.id and
	clis.id_cliente=cliproj.id_cliente
	
left join bc_cliente cli on
	clis.id_cliente=cli.id	
	
left join bc_usuario cap on
	cap.id=base.responsavel_captacao
	
left join bc_usuario ent on
	ent.id=base.responsavel_entrega
			
where convert(char(10),clis.dt_alteracao,23) between '2012-03-01' and '2012-03-31' and
	  (clis.id_status=7 and clis.id_substatus=32 and clis.exibir=1) 
	  
order by cli.nome	  