WITH tb_sumario_dias AS(
SELECT substr(DtCriacao,1,10) AS dtDia,
        count(DISTINCT IdTransacao) AS qntdTransacao
FROM transacoes

WHERE DtCriacao >= '2025-08-25'
AND DtCriacao < '2025-08-30'

GROUP BY dtDia
)

SELECT *,
        sum(qntdTransacao) OVER (ORDER BY dtDia) AS qntdTransacaoAcum

FROM tb_sumario_dias;




WITH tb_cliente_dia AS (
    SELECT idCliente,
    substr(DtCriacao,1,10) AS dtDia,
            count(DISTINCT IdTransacao) AS qntdTransacao

    FROM transacoes

    WHERE DtCriacao >= '2025-08-25'
    AND DtCriacao < '2025-08-30'

    GROUP BY idCliente, dtDia
),

tb_lag AS (

SELECT *,
        sum(qntdTransacao) OVER (PARTITION BY idCliente ORDER BY dtDia) AS acum,
        lag(qntdTransacao) OVER (PARTITION BY idCliente ORDER BY dtDia) AS lagTransacao
FROM tb_cliente_dia
)

SELECT *,
    1.* qntdTransacao / lagTransacao

FROM tb_lag;



