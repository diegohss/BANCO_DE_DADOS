-- Verificador de status dados
USE [havik]
GO
create procedure [dbo].[sp_relat_status]
(
@projetos int_list readonly,
@status int_list readonly,
@substatus int_list readonly,
@empresas int_list readonly,
@captacao int = null,
@entrega int = null,
@colab int = null,
@dt_ini datetime = null,
@dt_fim datetime = null,  
@pre int = null,
@colaborador int = null,
@tipo_relat int = null,
@usuario int
)
as
begin
select base.id_cliente,cli.nome cliente,
	   status.descricao status,
	   sub.descricao substatus,
	   us.nome_usuario responsavel_status,
	   convert(char(10),base.dt_alteracao,23) data_status

from bh_cli_status base

left join bc_usuario us on
	us.id=base.usuario_criacao
	
left join br_cli_status status on
	status.id=base.id_status
	
left join br_cli_substatus sub on
	sub.id=base.id_status		
	
left join bc_cliente cli on
	cli.id=base.id_cliente	

where (convert(char(10),base.dt_alteracao,23) between convert(char(10),@dt_ini,23) and convert(char(10),@dt_fim,23))
and 
(base.usuario_criacao=@colaborador or @colaborador is null)
and
(base.id_projeto in (select n from @projetos) or not exists (select n from @projetos))
and
(base.id_status in (select n from @status) or not exists (select n from @status)) 
and
(base.id_substatus in (select n from @substatus) or not exists (select n from @substatus)) 
and
base.exibir=1
end
INSERT INTO bh_relatorios
(
modulo,
tipo,
dt_alteracao,
usuario
)
VALUES
(
'relatorios',
@tipo_relat,
GETDATE(),
@usuario
)