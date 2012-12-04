use havik
go
select distinct cap.nome_usuario resp_captacao,
	   ent.nome_usuario resp_entrega, 
	   proj.id_empresa,
	   emp.nome cliente,
	   proj.tipo_produto,
	   prod.descricao produto,
	   proj.id id_projeto,
	   proj.nome projeto


from bc_projeto proj

left join bc_empresa_unq emp on
	emp.id=proj.id_empresa
	
left join br_tp_produto prod on
	prod.id=proj.tipo_produto	
	
left join bc_usuario cap on
	cap.id=proj.responsavel_captacao	
	
left join bc_usuario ent on
	ent.id=proj.responsavel_entrega
	
left join bh_proj_status st on
	st.id_projeto = proj.id

where emp.id not in (5,6) and proj.dt_fim is null 
and st.id_status is not null
and st.id_status in (2)
and proj.responsavel_entrega in 
(
38,
34,
54,
25,
52,
47,
95,
33,
15,
87,
11,
85,
3,
36,
21,
94,
91,
26,
22,
6,
86,
82,
84,
93,
89,
8
--82, 52, 91, 22, 3
)

order by resp_entrega

