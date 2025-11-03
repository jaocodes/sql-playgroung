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



-- Em média, em quantos dias os usuários voltam ao curso em 2025?


WITH cliente_dia AS (
        SELECT DISTINCT idCliente,
                substr(DtCriacao,1,10) AS dtDia
        FROM transacoes
        WHERE substr(DtCriacao,1,4) = '2025'
        ORDER BY idCliente, dtDia
),
tb_lag AS (
        SELECT *,
                lag(dtDia) OVER (PARTITION BY idCliente ORDER BY dtDia) AS lagDtDia

        FROM cliente_dia
), tb_diff_dt AS (

        SELECT *,
                julianday(dtDia) - julianday(lagDtDia) AS dtDiff

        FROM tb_lag
), avg_cliente AS (

        SELECT idCliente, avg(dtDiff) AS avgDia

        FROM tb_diff_dt
        GROUP BY idCliente
) 

SELECT avg(avgDia) FROM avg_cliente;


