create procedure sp_vw_cli_follow
(
@id_status int,
@id_substatus int
)
as
SELECT fups.entrevistador,fups.follow

  FROM bh_cli_fups fups
  
  where fups.ativo=1 and fups.id_status=@id_status and fups.id_substatus=@id_substatus
  
  