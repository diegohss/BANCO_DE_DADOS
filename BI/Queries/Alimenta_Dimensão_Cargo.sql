/* Alimenta a Dimens�o Cargo */

INSERT INTO [bi_kivah].[dbo].[dim_cargo]
(
           [cod_cargo]
           ,[cargo]
)
select id,descricao
from havik.dbo.br_cargo



