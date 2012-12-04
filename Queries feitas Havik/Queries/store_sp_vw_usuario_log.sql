create procedure sp_vw_usuario_log
(
@login varchar(50),
@senha varchar(50)
)
as

SELECT id
      ,nome_usuario
      ,login
      ,senha
      ,role
      ,enviados_id
      ,eliminados_idEliminado
      ,email_usuario
      ,cargo
FROM bc_usuario
where @login=login

go

create procedure sp_vw_usuario_logesenha
(
@login varchar(50),
@senha varchar(50)
)
as

SELECT id
      ,nome_usuario
      ,login
      ,senha
      ,role
      ,enviados_id
      ,eliminados_idEliminado
      ,email_usuario
      ,cargo
FROM bc_usuario
where @login=login and @senha=senha