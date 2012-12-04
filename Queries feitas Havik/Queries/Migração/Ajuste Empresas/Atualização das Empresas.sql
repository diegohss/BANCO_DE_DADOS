update bh_cli_profissional
set id_empresa=de_para.id
from tmp_de_para_empresas de_para
where de_para.descricao=bh_cli_profissional.empresa_antiga and
	  bh_cli_profissional.id_empresa is null
