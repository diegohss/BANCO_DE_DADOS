-- Listar os clientes que estão vinculados ao Projeto
-- E suas principais características

create procedure sp_vw_proj_cliente
(
@id_projeto int
)
as

select 
	cli.nome,
	DATEDIFF(year,cli.dt_nascimento,getdate()) idade,
	cid.MUNNOME cidade,
	uf.UFNOME estado,
	pro.segmento,
	pro.area,
	pro.subdivisao,
	pro.cargo,
	pro.dt_inicio,
	pro.dt_saida,
	pro.salario,
	pro.bonus,
	'' escolaridade,
	'' instituicao,
	'' graduacao,
	'' ano_formacao,
	'' email,
	'' email2,
	' 
	
		

from bh_cli_projeto base

inner join bc_cliente cli on
	cli.id=base.id_cliente
	
	
left join br_cidades cid on
	cid.MUNCOD=cli.id_cidade

left join br_estados uf on
	uf.UFCOD=cli.id_estado	
		
left join 
(select top 1 stat.id,
			 stat.id_projeto,
			 stat.
			 stat.id_status,
			 sta.descricao status,
			 stat.id_substatus,
			 sub.descricao substatus
from bh_cli_projeto stat
	left join br_proj_status sta on
		sta.id=stat.id_status
	left join br_proj_substatus sub on
		sub.id=stat.id_substatus	
order by stat.dt_alteracao desc) status on	
	

left join 
(
select 
prof.id_cliente,
car.descricao cargo,
seg.descricao segmento,
area.descricao area,
sub.descricao subdivisao,
dt_inicio = dbo.fn_dateformat(prof.dt_inicio,1),
dt_saida = dbo.fn_dateformat(prof.dt_saida,1),
prof.salario,
prof.bonus

from bh_cli_profissional prof 

left join br_cargo car on
	car.id=prof.id_cargo
	
left join br_segmento seg on
	seg.id=prof.id_segmento	
	
left join br_area area on
	area.id=prof.id_area	
	
left join br_subdivisao sub on
	sub.id=prof.id_subdivisao	
	
order by prof.dt_inicio desc	
)pro
on
	pro.id_cliente=base.id_cliente
	
	

where base.id_projeto=@id_projeto



