USE [havik]

go

update bc_usuario
set senha2=CONVERT(VARBINARY(255), PWDENCRYPT(senha))
