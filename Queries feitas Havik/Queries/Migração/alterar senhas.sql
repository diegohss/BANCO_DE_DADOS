use havik
go
update bc_usuario
set senha2=CONVERT(VARBINARY(255), PWDENCRYPT('123mudar')) 
where id=91
