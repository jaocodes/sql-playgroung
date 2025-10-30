-- como foi a curva de churn do curso de SQL?
-- essa query separa as interações de clientes distintos por dia
-- mas não serve, pois no dia 2 não sabemos quantos clientes do dia 2 estavam no dia 1 e o mesmo vale para os outros dias
SELECT 
        substr(DtCriacao,1,10) AS dia,
        count(DISTINCT idCliente)
FROM transacoes
WHERE DtCriacao >= '2025-08-25'
AND DtCriacao < '2025-08-30'
GROUP BY dia



WITH tb_clientes_d1 AS (
    SELECT DISTINCT idCliente

    FROM transacoes

    WHERE DtCriacao >= '2025-08-25'
    AND DtCriacao < '2025-08-26'
)

SELECT  substr(DtCriacao,1,10) AS dtDia,
        count(DISTINCT t1.idCliente) as qntdCliente,
        1. * count(DISTINCT t1.idCliente) / (SELECT count(*) FROM tb_clientes_d1) AS pctRetencao,
        1 - 1. * count(DISTINCT t1.idCliente) / (SELECT count(*) FROM tb_clientes_d1) AS pctChurn

FROM tb_clientes_d1 AS t1 
LEFT JOIN transacoes AS t2
ON t1.idCliente = t2.idCliente

WHERE DtCriacao >= '2025-08-25'
AND DtCriacao < '2025-08-30'

GROUP BY dtDia;

-- CTE com clientes do primeiro dia
-- LEFT JOIN com a tabela transações linkando os clientes do primeiro dia com as transações de todos os dias de curso
-- Agrupamento por dia e contagem por clientes distintos
-- Expressão para descobrir a porcentagem dos dias, 1. * (parte) / (pelo todo)

-- Dentre os clientes de Janeiro, quantos assistiram o curso de SQL?

-- com filtro no LEFT
WITH tb_clientes_jan AS (

SELECT DISTINCT idCliente FROM transacoes
WHERE DtCriacao >= '2025-01-01'
AND DtCriacao <'2025-02-01'

)

SELECT count(DISTINCT t1.idCliente),
        count(DISTINCT t2.idCliente)
FROM tb_clientes_jan AS t1
LEFT JOIN transacoes AS t2
ON t1.idCliente = t2.idCliente
AND t2.DtCriacao >= '2025-08-25'
AND t2.DtCriacao < '2025-08-30';

-- versão que compara por duas CTEs


WITH tb_clientes_jan AS (

SELECT DISTINCT idCliente FROM transacoes
WHERE DtCriacao >= '2025-01-01'
AND DtCriacao <'2025-02-01'

),
tb_clientes_curso AS
(
SELECT DISTINCT idCliente
FROM transacoes
WHERE DtCriacao >= '2025-08-25'
AND DtCriacao < '2025-08-30'
)

SELECT count(t1.idCliente) AS clienteJaneiro,
        count(t2.idCliente) AS clienteCurso

FROM tb_clientes_jan AS t1
LEFT JOIN tb_clientes_curso AS t2
ON t1.idCliente = t2.idCliente;
