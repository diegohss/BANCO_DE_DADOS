/* Procedure que a partir do status marca o status de Untouchable, Offlimits,
   Offer Rejected (Estado de atenção) */ 
/* Todo dia ela vai limpar a tabela de cicatriz e preenchê-la novamente */
/* Vai marcar também o offlimits conforme a empresa cadastrada */


create procedure sp_cli_cicatriz
as
INSERT INTO [havik].[dbo].[bh_cli_cicatriz]
(
           [id_cicatriz]
           ,[id_cliente]
           ,[ativo]
           ,[dt_criacao]
           ,[usuario_criacao]
)

select 
	cicatriz.tp_cicatriz,
	base.id_cliente,
	1,
	base.dt_alteracao,
	base.usuario_criacao	


from bh_cli_status base

left join bh_cli_fups cicatriz on
	cicatriz.id_status=base.id_status and
	cicatriz.id_substatus=base.id_substatus
	
where (cicatriz.id_status=base.id_status and
	  cicatriz.id_substatus=base.id_substatus) or
	  (cicatriz.tp_cicatriz=3 and base.dt_alteracao<=DATEADD(YEAR,3,GETDATE()))
