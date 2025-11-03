DELETE FROM relatorio_diario;

WITH tb_diario AS (
    SELECT  count(DISTINCT IdTransacao) as qntdTransacao,
            substr(DtCriacao,1,10) AS dtDia

    FROM transacoes
    GROUP BY dtDia
    ORDER BY dtDia
), tb_acum AS (
    SELECT *,
        sum(qntdTransacao) OVER (ORDER BY dtDia) AS qtdTransacaoAcum
    FROM tb_diario
)

INSERT INTO relatorio_diario

SELECT* FROM tb_acum;

SELECT * FROM relatorio_diario;