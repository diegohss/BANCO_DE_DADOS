use havik
go

select distinct cli.id,
	   cli.nome,
	   hist.empresa,
	   hist.salario,
	   hist.bonus,
	   hist.nome_usuario

from bc_cliente cli

left join bh_cli_codifica codi on
	codi.id_cliente=cli.id
	
left join bh_cli_profissional prof on
		prof.id_cliente=cli.id
		
--Profissional
left join (
select ult.id_cliente,
	   ult.id_empresa,
	   emp.nome empresa,
	   ult.empresa_antiga,
	   fil.nome filial,
	   ult.id_cargo,
	   cargo.descricao cargo,
	   ult.salario,
	   ult.bonus,
	   ult.usuario_alteracao,
	   us.nome_usuario
from (
SELECT a.id
FROM bh_cli_profissional a
WHERE a.ID IN
(SELECT TOP 1 b.id FROM bh_cli_profissional b WHERE b.id_cliente = a.id_cliente ORDER BY b.dt_inicio DESC)
)ult_prof
left join bh_cli_profissional ult on
	ult.id=ult_prof.id	
left join br_cargo cargo on
	cargo.id=ult.id_cargo	
left join bc_empresa_unq emp on
	emp.id=ult.id_empresa
left join bc_empresa_filial fil on
	fil.id=ult.id_filial		
left join bc_usuario us on
	us.id=ult.usuario_alteracao	
)hist on
	hist.id_cliente=cli.id				
		
where codi.id_segmento=1 and codi.id_area=12 and codi.id_subdivisao in (44,51,102)
	  and prof.id_cargo in (10,34)
	  
order by cli.id	  

