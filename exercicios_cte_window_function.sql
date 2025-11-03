-- Quantidade de transações acumuladas ao longo do tempo (diário)?
WITH tb_diario AS (
    SELECT  count(DISTINCT IdTransacao) as qntdTransacao,
            substr(DtCriacao,1,10) AS dtDia

    FROM transacoes
    GROUP BY dtDia
    ORDER BY dtDia
)

SELECT *,
    sum(qntdTransacao) OVER (ORDER BY dtDia) AS qtdTransacaoAcum
FROM tb_diario

-- Quando atingimos 100 mil transações?
WITH tb_diario AS (
    SELECT  count(DISTINCT IdTransacao) as qntdTransacao,
            substr(DtCriacao,1,10) AS dtDia

    FROM transacoes
    GROUP BY dtDia
    ORDER BY dtDia
), tb_acumulada AS (
    SELECT *,
        sum(qntdTransacao) OVER (ORDER BY dtDia) AS qtdTransacaoAcum
    FROM tb_diario
)

SELECT * FROM tb_acumulada
WHERE qtdTransacaoAcum >= 100000
ORDER BY qtdTransacaoAcum
LIMIT 1


-- Qual dia da semana mais ativo de cada usuário
WITH tb_cliente_semana AS (
    SELECT  idCliente,
            strftime('%w',substr(DtCriacao,1,10)) AS dtDiaSemana,
            count(DISTINCT IdTransacao) AS qtdTrasacao

    FROM transacoes

    GROUP BY idCliente, dtDiaSemana
), tb_rn AS (
SELECT *,
        ROW_NUMBER() OVER (PARTITION BY idCliente ORDER BY qtdTrasacao DESC) AS rn
 FROM tb_cliente_semana
)

SELECT * FROM tb_rn WHERE rn = 1;


-- Saldo de pontos acumulados de cada usuário?
WITH tb_cliente_dia AS (
    SELECT  idCliente,
            substr(DtCriacao,1,10) AS dtDia,
            sum(qtdePontos) AS sumDia

    FROM transacoes

    GROUP BY idCliente, dtDia
)

SELECT *,
    sum(sumDia) OVER (PARTITION BY idCliente ORDER BY dtDia) as saldoPontos

FROM tb_cliente_dia;
