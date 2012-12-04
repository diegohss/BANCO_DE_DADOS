alter procedure sp_vw_cli_drop_havik
(
@follow int = null,
@entrevistador int = null
)
as
begin

if @entrevistador=1
begin
SELECT base.id,base.nome_usuario
  FROM bc_usuario base
  where base.cargo in ('consultor','partner')
end  

if @follow=1
begin
SELECT base.id,base.nome_usuario
  FROM bc_usuario base
  where base.cargo in ('r1','r2')
end  

end
  