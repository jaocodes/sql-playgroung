-- Quantidade de transações acumuladas ao longo do tempo (diário)?

DROP TABLE IF EXISTS relatorio_diario;

CREATE TABLE IF NOT EXISTS relatorio_diario AS

WITH tb_diario AS (
    SELECT  count(DISTINCT IdTransacao) as qntdTransacao,
            substr(DtCriacao,1,10) AS dtDia

    FROM transacoes
    GROUP BY dtDia
    ORDER BY dtDia
)

SELECT *,
    sum(qntdTransacao) OVER (ORDER BY dtDia) AS qtdTransacaoAcum
FROM tb_diario;


SELECT * FROM relatorio_diario;


DROP TABLE IF EXISTS clientes_d28;

CREATE TABLE clientes_d28 (
    idCliente varchar(250) PRIMARY KEY,
    qtdTransacoes INT
);


DELETE FROM clientes_d28;

INSERT INTO clientes_d28
SELECT IdCliente, count(DISTINCT IdTransacao) AS qtdTransacoes 
FROM transacoes
WHERE substr(DtCriacao,1,10) >= '2025-08-25'
GROUP BY idCliente;

SELECT * FROM clientes_d28;