use havik

go


CREATE UNIQUE NONCLUSTERED INDEX
proj_ben ON bh_proj_beneficios
(
id_projeto,
beneficios
)