DELETE FROM bl_cli_status_substatus
DBCC CHECKIDENT ('bl_cli_status_substatus', RESEED, 0)

go

DELETE FROM bh_cli_status
DBCC CHECKIDENT ('bh_cli_status', RESEED, 0)

go

DELETE FROM br_cli_substatus
go
DBCC CHECKIDENT ('br_cli_substatus', RESEED, 0)