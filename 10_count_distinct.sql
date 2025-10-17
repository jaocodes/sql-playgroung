SELECT count(DISTINCT IdCliente) FROM clientes;

SELECT DISTINCT flTwitch,flEmail from clientes;

SELECT count(DISTINCT flTwitch), count(DISTINCT flEmail) from clientes;

SELECT 
count(*),
count(DISTINCT IdTransacao),
count(DISTINCT idCliente)

FROM transacoes

WHERE DtCriacao >= '2025-07-01'
AND DtCriacao < '2025-08-01'

ORDER BY DtCriacao DESC
