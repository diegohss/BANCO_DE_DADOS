use havik_teste
go
declare @teste int_list
insert @teste (n) values (1),(2),(3)
exec sp_vw_relat_substatus2 @teste