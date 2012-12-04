SELECT c.oid AS "OID",

 n.nspname AS "Esquema",

 c.relname AS "Tabela",

 col.attname coluna

FROM pg_catalog.pg_class c

    LEFT JOIN pg_catalog.pg_namespace n ON 
	n.oid = c.relnamespace

left JOIN pg_attribute col ON 
	col.attrelid=c.oid

WHERE n.nspname='rh'
