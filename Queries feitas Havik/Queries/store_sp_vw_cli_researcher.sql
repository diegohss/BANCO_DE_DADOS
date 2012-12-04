create procedure sp_vw_cli_researcher
(
@id_cliente int
)
as
select  cli.id,
	   (con.c_senso + con.c_eloquencia + con.c_objetivo + con.c_energia +
		con.c_ouvinte + con.c_mkt + con.c_credibilidade + con.c_mkt)/8 media_comunicacao,
	   (pot.p_inteligencia + pot.p_maturidade + pot.p_visao + pot.p_confianca +
	    pot.p_honestidade + pot.p_punch + pot.p_carisma) / 7 media_potencial,  
	   rel.salario,
	   rel.movimento,
	   rel.mudanca,
       col.nome_usuario,
       con.dt_alteracao    	

FROM bc_cliente cli

left join bc_cli_researcher_c con on
	con.id_cliente=cli.id
	
left join bc_cli_researcher_p pot on
	pot.id_cliente=cli.id
	
left join bc_cli_researcher_r rel on
	rel.id_cliente=cli.id
	
left join bc_usuario col on
	col.id=con.usuario_alteracao
	
where cli.id=@id_cliente			
	
	
	
	