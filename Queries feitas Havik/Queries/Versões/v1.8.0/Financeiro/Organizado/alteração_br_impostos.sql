use havik
go

alter table br_impostos
add aliquota_net money null

go

alter table br_impostos
add verificar tinyint null