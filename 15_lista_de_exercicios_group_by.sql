-- Quantos clientes tem email cadastrado?
SELECT sum(flEmail) FROM clientes;

--Qual cliente juntou mais pontos positivos em 2025-05?
SELECT IdCliente
-- sum(qtdePontos) AS pontuacaoMaio
FROM transacoes
WHERE DtCriacao >= '2025-05-01'
AND DtCriacao < '2025-06-01'
AND QtdePontos > 0
GROUP BY IdCliente
ORDER BY sum(qtdePontos) DESC
LIMIT 1;

-- Qual cliente fez mais transações no ano de 2024?
SELECT IdCliente
    -- count(IdTransacao) AS totalTransacoes2024
FROM transacoes
-- WHERE DtCriacao LIKE '2024%'
WHERE substr(DtCriacao, 1,4) = '2024'
GROUP BY IdCliente
ORDER BY count(*) DESC
LIMIT 1;

-- Quantos produtos são de rpg?
SELECT
count(*)
FROM produtos
WHERE DescCategoriaProduto = 'rpg';

SELECT DescCategoriaProduto,
count(*)
FROM produtos
GROUP BY DescCategoriaProduto
HAVING DescCategoriaProduto = 'rpg';

-- Qual o valor médio de pontos positivos por dia?
SELECT  sum(qtdePontos) AS totalPontos,
        count(DISTINCT substr(DtCriacao,1,10)) AS qntDiasUnicos,
        sum(qtdePontos) / count(DISTINCT substr(DtCriacao,1,10)) AS mediaPontosDia
FROM transacoes
WHERE qtdePontos > 0;

-- outra interpretação do comando do exercício
SELECT substr(DtCriacao,1,10) AS dtDia,
        avg(qtdePontos) AS mediaDia

FROM transacoes
WHERE qtdePontos > 0

GROUP BY 1  -- primeira coluna do SELECT
ORDER BY 2; -- segunda coluna do SELECT

-- Qual dia da semana quem mais pedidos em 2025?
SELECT  strftime('%w',substr(DtCriacao,1,10)) AS diaSemana,
        count(*)
FROM transacoes
WHERE substr(DtCriacao,1,4) = '2025'
GROUP BY 1
ORDER BY 2 DESC

-- Qual o produto mais transacionado?
SELECT IdProduto,
sum(QtdeProduto)
FROM transacao_produto
GROUP BY IdProduto
ORDER BY sum(QtdeProduto) DESC;

-- Qual o produto com mais pontos transacionados?
SELECT IdProduto,
sum(vlProduto)
FROM transacao_produto
GROUP BY IdProduto
ORDER BY sum(vlProduto) DESC;

SELECT * from produtos;