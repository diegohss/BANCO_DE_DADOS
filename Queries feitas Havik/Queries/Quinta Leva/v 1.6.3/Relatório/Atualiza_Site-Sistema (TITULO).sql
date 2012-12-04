use havik_teste
go
update st
set st.titulo=proj.nome
from bc_proj_site st
left join bc_projeto proj on
	proj.id=st.id_projeto
where st.titulo is null