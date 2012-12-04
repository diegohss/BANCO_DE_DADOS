use havik_teste
go

alter procedure sp_vw_relat_substatus
(
@status varchar(40) null
)
as

-- Cursor
declare @i int
declare @k int
declare @charatual varchar(1)
declare @stringatual varchar(50)
declare @cod 
set @k=1

while @k<=len(@status)
begin            
             set @CharAtual = substring(@status, k, 1)
             If @CharAtual = ',' Or @CharAtual = ''
                codproj(j) = StringAtual
                StringAtual = ""
                CharAtual = ""
                j = j + 1
             End If
             StringAtual = StringAtual & CharAtual
end



declare @id_status int = null

declare @tmp_table table(
	id_substatus int NULL,
	substatus varchar(200) NULL,
	id_status int NULL
)

declare stat cursor for
select @status

open stat

fetch next from stat into @id_status
insert into @tmp_table
select base.id_substatus,
	   sub.descricao substatus,
	   base.id_status

from bl_cli_status_substatus base

left join br_cli_substatus sub on
	sub.id=base.id_substatus
	
where base.id_status in (@id_status)	