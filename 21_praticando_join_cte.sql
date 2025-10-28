-- Quem iniciou o curso no primeiro dia, em média assistiu quantas aulas?

WITH tb_primeiro_dia AS (
    SELECT DISTINCT idCliente
    FROM transacoes
    WHERE substr(DtCriacao,1,10) = '2025-08-25'

),

tb_dias_curso AS (
    SELECT DISTINCT
    IdCliente,
    substr(DtCriacao,1,10) AS presenteDia
    FROm transacoes
    WHERE DtCriacao >= '2025-08-25'
    AND DtCriacao < '2025-08-30'
),
tb_cliente_dias AS (
    SELECT t1.idCliente,
            count(DISTINCT t2.presenteDia) AS qtdDias
    FROM tb_primeiro_dia AS t1
    LEFT JOIN tb_dias_curso AS t2
    ON t1.idCliente = t2.idCliente
    GROUP BY t1.idCliente
)

SELECT avg(qtdDias) FROM tb_cliente_dias;
