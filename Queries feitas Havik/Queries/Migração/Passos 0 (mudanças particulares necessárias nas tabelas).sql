use havik

go

  update candidato
  set celular=''
  where idcandidato='3616'
  
go

alter table candidato
alter column research nvarchar(max)  

go
