select proj.id,proj.nome,proj.dt_ini,proj.dt_fim,
	   proj.ultimo_status,
	   st.descricao ultimo_status,
	   cap.nome_usuario resp_captacao,proj.responsavel_captacao,
	   ent.nome_usuario resp_entrega,proj.responsavel_entrega
		
from bc_projeto proj

left join bc_usuario ent on
	ent.id=proj.responsavel_entrega
	
left join bc_usuario cap on
	cap.id=proj.responsavel_entrega
	
left join br_proj_status st on
	st.id=proj.ultimo_status		

where proj.id in
(
314,
315,
347,
411,
412,
413,
414,
421,
430,
431,
452,
453,
458,
466,
471,
474,
545,
549,
551,
552,
555,
557,
578,
590,
592,
593,
602,
638,
668,
709,
785,
788,
789,
803,
804,
805,
815,
828,
834,
836,
884,
902,
928,
929,
931,
949,
951
)