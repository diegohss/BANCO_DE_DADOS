update bc_projeto
set bc_projeto.ultimo_status=st.id_status,
	bc_projeto.ultimo_substatus=st.id_substatus
from bh_proj_status st
where bc_projeto.id=st.id_projeto