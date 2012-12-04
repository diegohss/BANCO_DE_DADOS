use havik_teste
go
alter table bh_cli_status
alter column id_status bigint null

/*ALTER TABLE [dbo].[bh_cli_status]  WITH CHECK ADD FOREIGN KEY([id_status])
REFERENCES [dbo].[br_cli_status] ([id])*/