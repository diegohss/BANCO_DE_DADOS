use havik

select proj.id id_projeto,
	   proj.nome projeto,
	   tipo.descricao tipo_anexo,
	   resp.nome_usuario responsavel_entrega,
	   us.nome_usuario,
	   COUNT(base.id) qtd_documentos
from bh_proj_anexos base

	left join bc_projeto proj on
		proj.id=base.id_projeto
	left join bc_usuario us on
		us.id=base.usuario_criacao	
	left join bc_usuario resp on
		resp.id=proj.responsavel_entrega		
	left join br_proj_tp_anexo tipo on
		tipo.id=base.tipo_anexo	
	
group by
	   proj.id,
	   proj.nome,
	   tipo.descricao,
	   resp.nome_usuario,
	   us.nome_usuario
	   
   