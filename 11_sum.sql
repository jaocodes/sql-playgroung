SELECT * FROM transacoes WHERE DtCriacao >= '2025-07-01' AND DtCriacao < '2025-08-01';

SELECT * FROM transacoes
WHERE DtCriacao >= '2025-07-01'
AND DtCriacao < '2025-08-01'
AND qtdePontos <0;

SELECT sum(qtdePontos) FROM transacoes
WHERE DtCriacao >= '2025-07-01' 
AND DtCriacao < '2025-08-01';

SELECT sum(qtdePontos) FROM transacoes
WHERE DtCriacao >= '2025-07-01' 
AND DtCriacao < '2025-08-01'
AND qtdePontos > 0;

SELECT sum(qtdePontos) FROM transacoes
WHERE DtCriacao >= '2025-07-01' 
AND DtCriacao < '2025-08-01'
AND qtdePontos < 0;


SELECT IdTransacao, qtdePontos 
FROM transacoes
WHERE DtCriacao >= '2025-07-01'
AND DtCriacao < '2025-08-01';


SELECT IdTransacao, qtdePontos,
    CASE
        WHEN QtdePontos > 0 THEN QtdePontos
    END AS qntDePontosPositivos,
    CASE
        WHEN QtdePontos < 0 THEN QtdePontos
    END AS qntDePontosNegativos
FROM transacoes
WHERE DtCriacao >= '2025-07-01'
AND DtCriacao < '2025-08-01';

SELECT sum(qtdePontos) as qntDePontosAgregado,
    sum(CASE
        WHEN QtdePontos > 0 THEN QtdePontos
    END) AS qntDePontosPositivos,
    sum(CASE
        WHEN QtdePontos < 0 THEN QtdePontos
    END) AS qntDePontosNegativos
FROM transacoes
WHERE DtCriacao >= '2025-07-01'
AND DtCriacao < '2025-08-01';

SELECT sum(qtdePontos) as qntDePontosAgregado,
    sum(CASE
        WHEN QtdePontos > 0 THEN QtdePontos
    END) AS qntDePontosPositivos,
    sum(CASE
        WHEN QtdePontos < 0 THEN QtdePontos
    END) AS qntDePontosNegativos,
    count(CASE
        WHEN QtdePontos < 0 THEN QtdePontos
    END) AS qntDeTransacoesNegativas
FROM transacoes
WHERE DtCriacao >= '2025-07-01'
AND DtCriacao < '2025-08-01';