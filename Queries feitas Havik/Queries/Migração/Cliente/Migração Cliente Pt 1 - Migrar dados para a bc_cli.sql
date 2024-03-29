/****** Migrar dados de candidato para bc_cli ******/

use havik

go

DELETE from bc_cliente2

go

insert into bc_cliente2
(
	id,
	nome,
	cpf,
	dt_nascimento,
	dt_alteracao,
	usuario_alteracao,
	id_antiga
) 
SELECT 
	base.idCandidato
	,base.nome_candidato
    ,base.cpf
    ,base.dtNascimento      
    ,base.dtCadastro
    ,isnull(us.id,1)
    ,base.idCandidato
    
  FROM candidato base
  
  left join bc_usuario us on
	us.nome_usuario=base.usuarioCadastro
	
go
/*
update bc_cliente2
set usuario_alteracao=1	
where usuario_alteracao is null

go
*/