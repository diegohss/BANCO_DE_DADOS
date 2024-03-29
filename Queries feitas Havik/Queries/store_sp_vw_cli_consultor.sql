create procedure sp_vw_cli_consultor
(
@id_cliente int
)
as

SELECT 
        cli.id,
       (base.a_senso + base.a_saudacao + base.a_impressao + 
        base.a_levantou +  base.a_profissionalismo)/5 media_apresentacao,
       (con.c_senso + con.c_eloquencia + con.c_objetivo + con.c_energia +
		con.c_ouvinte + con.c_mkt + con.c_credibilidade + con.c_estruturado
		)/8 media_comunicacao,
		(pot.p_inteligencia + pot.p_maturidade + pot.p_visao + pot.p_confianca +
		 pot.p_honestidade + pot.p_punch + pot.p_carisma)/7 media_potencial,
		rel.salario,
		rel.movimento,
		rel.mudanca,
       col.nome_usuario,
       base.dt_alteracao

FROM bc_cliente cli

left join bc_cli_consultor_a base on
	base.id_cliente=cli.id

left join bc_cli_consultor_c con on
	con.id_cliente=cli.id
	
left join bc_cli_consultor_p pot on
	pot.id_cliente=cli.id
	
left join bc_cli_consultor_r rel on
	rel.id_cliente=cli.id
	
left join bc_usuario col on
	col.id=base.usuario_alteracao  
	
where cli.id=@id_cliente
  