-- common table expression

-- Exibir todos os clientes que participaram do primeiro e do último dia de curso, versão não performática

-- SELECT count(DISTINCT idCliente)

-- FROM transacoes AS t1

-- WHERE t1.IdCliente IN 
-- (
-- SELECT DISTINCT IdCliente 
-- FROM transacoes 
-- WHERE substr(DtCriacao, 1,10) = '2025-08-25'
-- ) 

-- AND

-- substr(t1.DtCriacao,1,10) = '2025-08-29';

-- Exibir todos os clientes que participaram do primeiro e do último dia de curso, versão performática
-- usando CTE

WITH tb_cliente_primeiro_dia AS (

    SELECT DISTINCT idCliente

    FROM transacoes

    WHERE substr(DtCriacao,1,10) = '2025-08-25'

), tb_cliente_ultimo_dia AS(

    SELECT DISTINCT idCliente

    FROM transacoes

    WHERE substr(DtCriacao,1,10) = '2025-08-29'
)

SELECT * FROM tb_cliente_ultimo_dia;



WITH tb_cliente_primeiro_dia AS (

    SELECT DISTINCT idCliente

    FROM transacoes

    WHERE substr(DtCriacao,1,10) = '2025-08-25'

), tb_cliente_ultimo_dia AS(

    SELECT DISTINCT idCliente

    FROM transacoes

    WHERE substr(DtCriacao,1,10) = '2025-08-29'
), tb_join AS (
    SELECT t1.idCliente AS primCliente,
            t2.idCliente AS ultCliente
    FROM tb_cliente_primeiro_dia AS t1
    LEFT JOIN tb_cliente_ultimo_dia AS t2
    ON t1.idCliente = t2.idCliente
)

SELECT count(primCliente),
        count(ultCliente),
        1. * count(ultCliente) / count(primCliente)

FROM tb_join;
