select pre.id_cliente,cli.nome,pre.obs,pre.dt_alteracao
from bh_cli_researcher_obs pre
left join bc_cliente cli on
	cli.id=pre.id_cliente
where pre.id_cliente in
(
13795,
40727,
14642,
4367,
4746,
4743,
40855,
40623,
40847,
40813,
40802,
10534,
40717,
40701,
36233,
40676,
40643,
40639,
40607,
40598,
14382,
34892
)