use havik

go

update bc_projeto
set id_empresa=proj.id_empresa_nova
from dbo.Projetos proj  
where id=proj.idoportunidade

go

update bc_projeto
set tipo_produto=1