SELECT distinct c.oid AS "OID",

 n.nspname AS "Esquema",

 c.relname AS "Tabela",

 col.attname coluna,

 tipo.data_type,

 character_maximum_length qtd_caracteres

FROM pg_catalog.pg_class c

    LEFT JOIN pg_catalog.pg_namespace n ON 
	n.oid = c.relnamespace

left JOIN pg_attribute col ON 
	col.attrelid=c.oid

left join information_schema.columns tipo on
	tipo.column_name=col.attname

WHERE n.nspname='rh'
