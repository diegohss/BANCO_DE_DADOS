alter table bh_emp_noticias
add exibir smallint null

go

alter table bh_emp_offlimits
add exibir smallint null

go

update bh_emp_noticias
set exibir='1'

go

update bh_emp_offlimits
set exibir='1'

go

