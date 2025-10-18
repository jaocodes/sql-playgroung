SELECT IdCliente,
        sum(QtdePontos) as pontosTotaisJulho

FROM transacoes
WHERE DtCriacao >= '2025-07-01'
AND DtCriacao < '2025-08-01'

GROUP BY IdCliente
HAVING pontosTotaisJulho >= 4000

ORDER BY pontosTotaisJulho DESC;
