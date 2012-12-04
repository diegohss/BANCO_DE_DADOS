SELECT a.usuario_alteracao,a.id_cliente,a.dt_alteracao
FROM bc_cli_researcher a
WHERE a.id IN
(SELECT TOP 2 b.id FROM bc_cli_researcher b WHERE b.usuario_alteracao = a.usuario_alteracao ORDER BY b.dt_alteracao DESC)