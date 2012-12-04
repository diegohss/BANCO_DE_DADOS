
SELECT distinct tab.TABLE_CATALOG base_dados,
	   tab.TABLE_NAME nome_tabelas,
	   tab.COLUMN_NAME nome_coluna,
	   tab.ORDINAL_POSITION posição_coluna,
	   tab.DATA_TYPE tipo_dados,
	   tab.IS_NULLABLE nulo,
	   tab.CHARACTER_MAXIMUM_LENGTH tamanho_max_campo/*,
	   tmp.CONSTRAINT_NAME nome_chave*/
	   
	   	   	
FROM INFORMATION_SCHEMA.COLUMNS tab

/*left join INFORMATION_SCHEMA.KEY_COLUMN_USAGE tmp on
	tmp.table_name=tab.TABLE_NAME and
	tmp.column_name=tab.COLUMN_NAME*/

where tab.TABLE_CATALOG='bi_kivah'

order by tab.TABLE_NAME, tab.ORDINAL_POSITION 
