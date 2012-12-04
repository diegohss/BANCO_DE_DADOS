use havik

go

select distinct base.id,base.nome,acad.ano_conclusao,acad.instituicao,grad.descricao graduação,
	   us.nome_usuario

from bc_cliente base

left join bc_cli_base_cvs cvs on
	cvs.id_cliente=base.id	
	
left join bh_cli_academico acad on
	acad.id_cliente=base.id and
	exibir=1
	
left join br_graduacao grad on
	grad.id=acad.id_graduacao
	
left join bc_usuario us on
	us.id=acad.usuario_criacao	
	
where contains(cvs.dados,'(poli or usp or maua or mauá) and engenharia') or
	((acad.instituicao like '%poli%' or acad.instituicao like '%usp%' or acad.instituicao like '%maua%') and
	grad.descricao like '%engenharia%') and
	(acad.ano_conclusao<=2014 or acad.ano_conclusao is null)
	
	
	