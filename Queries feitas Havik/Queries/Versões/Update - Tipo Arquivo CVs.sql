use havik
go

update bc_cli_base_cvs 
--application/vnd.ms-excel
set tipo_arquivo='application/vnd.ms-excel'
where right(nome_arquivo,5)='.xlsx' and (tipo_arquivo is null or tipo_arquivo='')