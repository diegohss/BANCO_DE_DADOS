
delete from bl_segmento_area
delete from bl_area_subdivisao
--delete from br_segmento
delete from br_area
delete from br_subdivisao

DBCC CHECKIDENT ('bl_segmento_area', RESEED, 0)
DBCC CHECKIDENT ('bl_area_subdivisao', RESEED, 0)
DBCC CHECKIDENT ('br_area', RESEED, 0)
DBCC CHECKIDENT ('br_subdivisao', RESEED, 0)
