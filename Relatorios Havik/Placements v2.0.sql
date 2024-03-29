USE [havik]
GO
/****** Object:  StoredProcedure [dbo].[nrel_placements]    Script Date: 09/26/2012 17:01:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--drop procedure nrel_placements
ALTER procedure [dbo].[nrel_placements]
(
@projetos int_list readonly, 
@status int_list readonly, 
@substatus int_list readonly, 
@empresas int_list readonly, 
@captacao int = null, 
@entrega int = null, 
@colab int = null, 
@dt_ini datetime = null, 
@dt_fim datetime = null,   
@pre int = null, 
@colaborador int = null, 
@tipo_relat int = null, 
@usuario int = null,
@equipe int=null,
@segmento int=null
)
as
begin

select  cap.nome_usuario resp_captacao,
	    equ.nome_usuario equipe,
        ent.nome_usuario resp_entrega,
        col.nome_usuario researcher,
		area.descricao area,     
        seg.descricao segmento,
        count(distinct clis.id_cliente) qtd_clientes
from(
select distinct ult.id_cliente,ult.id_projeto,ult.id_status,ult.id_substatus,
       ult.dt_alteracao
from(
select id_cliente,MAX(id) id
from bh_cli_status
where ((id_status=7 and id_substatus=32 and exibir=1) or
	  (id_status=8 and id_substatus=32 and exibir=1) or
	  (id_status=7 and id_substatus is null and exibir=1))
group by id_cliente)t

left join bh_cli_status ult on
	ult.id=t.id	
)clis

left join bc_projeto proj on
	proj.id=clis.id_projeto	
	
left join br_area area on
	area.id=proj.area	
	
left join br_segmento seg on
	seg.id=proj.segmento
		
-- Responsavel pela captação do Projeto
left join bc_usuario cap on
	cap.id=proj.responsavel_captacao	
	
-- Responsavel pela entrega do Projeto	
left join bc_usuario ent on
	ent.id=proj.responsavel_entrega
	
-- Definindo Equipe conforme informado no projeto	

left join bc_usuario equ on
	equ.id=proj.equipe
	
-- Researcher Projeto
-- Definindo Equipe conforme informado no projeto	
left join bc_usuario col on
	col.id=proj.colaborador_responsavel
	
	
where
-- Período
convert(char(10),clis.dt_alteracao,23) between 
convert(char(10),@dt_ini,23) and convert(char(10),@dt_fim,23)
and
-- Filtro Responsavel Captação
(proj.responsavel_captacao=@captacao or @captacao is null)
and
-- Filtro Equipe
(proj.equipe=@equipe or @equipe is null)
and
-- Filtro Segmento
(seg.id=@segmento or @segmento is null)

group by 
		cap.nome_usuario,
	    equ.nome_usuario,
        ent.nome_usuario,
        col.nome_usuario,
		area.descricao,     
        seg.descricao  

end