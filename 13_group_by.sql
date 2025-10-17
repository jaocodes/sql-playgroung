SELECT * FROM transacao_produto;

SELECT * FROM transacao_produto 
WHERE IdProduto = 11;

SELECT count(*) FROM transacao_produto 
WHERE IdProduto = 11;

SELECT count(*) FROM transacao_produto 
WHERE IdProduto = 5;


SELECT  IdProduto,
        count(*)
FROM transacao_produto
GROUP BY IdProduto;


SELECT * 
FROM transacoes
WHERE DtCriacao >= '2025-07-01'
AND DtCriacao < '2025-08-01';


SELECT IdCliente,
        sum(QtdePontos) as pontosTotaisJulho

FROM transacoes
WHERE DtCriacao >= '2025-07-01'
AND DtCriacao < '2025-08-01'

GROUP BY IdCliente
ORDER BY pontosTotaisJulho DESC
LIMIT 10;


SELECT IdCliente,
        sum(QtdePontos) as pontosTotaisJulho,
        count(IdTransacao) as qtdTransacoesCliente

FROM transacoes
WHERE DtCriacao >= '2025-07-01'
AND DtCriacao < '2025-08-01'

GROUP BY IdCliente
ORDER BY qtdTransacoesCliente DESC;
