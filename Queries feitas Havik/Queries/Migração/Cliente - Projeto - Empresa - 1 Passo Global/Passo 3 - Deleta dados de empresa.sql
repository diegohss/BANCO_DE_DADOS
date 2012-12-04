-- Zera o Identity da tabela
--DBCC CHECKIDENT ('bc_cli_consultor', RESEED, 0)

delete from bh_empresa
go
delete from bh_emp_status
go
delete from bh_emp_offlimits
go
delete from bh_emp_obs
go
delete from bh_emp_noticias
go
delete from bh_emp_fin_particularidades
go
delete from bh_emp_fin_impostos
go
delete from bh_emp_contato
go
delete from bh_emp_concorrentes
go
delete from bc_empresa_grupo
go
delete from bc_empresa_filial
go
delete from bc_emp_mercado
go
delete from bc_emp_financeiro
go
delete from bc_emp_contrato
go
delete from bc_empresa_unq
go
