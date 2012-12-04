USE bi_kivah
GO

CREATE TABLE fato_cliente_empresa(
	cod_tempo int foreign key references dim_tempo(cod_tempo),
	cod_empresa bigint foreign key references dim_empresa(cod_empresa),
	cod_keyaccount int foreign key references dim_usuario(cod_usuario),
	qtd_ativos float NULL,
	qtd_inativos float NULL,
	qtd_sem_offlimits float NULL,
	qtd_manutencao float NULL,
	qtd_prospeccao float NULL,
	qtd_radar float NULL
) 