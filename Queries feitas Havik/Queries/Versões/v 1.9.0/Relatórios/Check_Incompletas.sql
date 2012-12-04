select *
from bh_cli_consultor_obs
where id_cliente=42049;

select *
from bc_cli_consultor
where id_cliente=42049;

select *
from bh_cli_status st
where st.id_cliente=42049 and ((st.id_status=3 and st.id_substatus=18 and st.exibir=1) or
(st.id_status=2 and st.id_substatus=13 and st.exibir=1) or 
(st.id_status=3 and st.id_substatus=17 and st.exibir=1));