select tmp.CONSTRAINT_NAME nome_chave,
	   tmp.CONSTRAINT_CATALOG banco,
	   tmp.TABLE_NAME tabela,
	   tmp.COLUMN_NAME coluna,
	   tmp.ORDINAL_POSITION posição
from INFORMATION_SCHEMA.KEY_COLUMN_USAGE tmp
/*	tmp.table_name=tab.TABLE_NAME
	and
	tmp.column_name=tab.COLUMN_NAME*/
	
	