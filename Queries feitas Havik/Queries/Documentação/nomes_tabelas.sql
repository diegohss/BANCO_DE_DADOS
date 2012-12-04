SELECT distinct tab.TABLE_CATALOG base_dados,
	   tab.TABLE_NAME nome_tabelas
  	   	   	
FROM INFORMATION_SCHEMA.COLUMNS tab

/*left join INFORMATION_SCHEMA.KEY_COLUMN_USAGE tmp on
	tmp.table_name=tab.TABLE_NAME and
	tmp.column_name=tab.COLUMN_NAME*/

where tab.TABLE_CATALOG='havik' 

group by tab.TABLE_CATALOG,
	   tab.TABLE_NAME

order by tab.TABLE_NAME