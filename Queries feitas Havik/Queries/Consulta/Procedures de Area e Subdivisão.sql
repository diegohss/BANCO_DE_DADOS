create procedure sp_vw_cli_area
(
@id int = null
)
as
SELECT [id_area], [area], [id_segmento] FROM [vw_cli_segmento_area] WHERE (id_segmento = @id)

go

create procedure sp_vw_proj_area
(
@id int = null
)
as
SELECT [id_area], [area], [id_segmento] FROM [vw_cli_segmento_area] WHERE (id_segmento = @id)

go

create procedure sp_vw_emp_area
(
@id int = null
)
as
SELECT [id_area], [area], [id_segmento] FROM [vw_cli_segmento_area] WHERE (id_segmento = @id)

go


create procedure sp_vw_cli_subdivisao
(
@id int=null
)
as
SELECT [id_subdivisao], [subdivisao], [id_area] FROM [vw_cli_area_subdivisao] WHERE (id_area = @id)

go

create procedure sp_vw_proj_subdivisao
(
@id int=null
)
as
SELECT [id_subdivisao], [subdivisao], [id_area] FROM [vw_cli_area_subdivisao] WHERE (id_area = @id)

go

create procedure sp_vw_emp_subdivisao
(
@id int=null
)
as
SELECT [id_subdivisao], [subdivisao], [id_area] FROM [vw_cli_area_subdivisao] WHERE (id_area = @id)

go




