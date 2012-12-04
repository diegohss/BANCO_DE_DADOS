use havik

go

delete from bh_cli_profissional

DBCC CHECKIDENT ('bh_cli_profissional', RESEED, 0)

go

INSERT INTO bh_cli_profissional
(
            id_cliente
           ,id_empresa
           ,dt_inicio
           ,dt_saida
           ,id_segmento
           ,id_area
           ,id_subdivisao
           ,id_cargo
           ,salario
           ,bonus
           ,total_cash
           ,realizacoes
           ,dt_alteracao
           ,usuario_alteracao
           ,tipo_contato
           ,empresa_antiga
)

select
base.idCandidato,
null,
'',
'',
base.segmento_idSegmento,
base.area_idArea,
base.subdivisao_idSubDivisao,
base.cargo_idCargo,
base.remMensal,
base.bonus,
base.totalCash,
null,
GETDATE(),
isnull(us.id,'1'), 
null,
base.empAtual

from candidato base

  left join bc_usuario us on
	us.nome_usuario=base.usuarioCadastro
	
go

update bh_cli_profissional
set    realizacoes=dbo.HTMLFullDecode3(base.research)
from candidato base         
where base.idCandidato=id_cliente and (base.research is not null)

go