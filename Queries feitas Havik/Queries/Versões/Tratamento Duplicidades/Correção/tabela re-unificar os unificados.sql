use havik
SELECT 
base.id_cliente_dup id_cliente,
base.cliente_dup nome,
base.id_cliente id_nova
into tmp_cli_dup_faltantes
  FROM tmp_de_para_dup base