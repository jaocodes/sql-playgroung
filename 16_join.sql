
SELECT *
FROM transacao_produto
LEFT JOIN produtos
ON transacao_produto.IdProduto = produtos.IdProduto;

-- 258101 LEFT JOIN

SELECT *
FROM transacao_produto
INNER JOIN produtos
ON transacao_produto.IdProduto = produtos.IdProduto;

-- 257866 INNER JOIN


SELECT *
FROM transacao_produto AS t1
INNER JOIN produtos AS t2
ON t1.IdProduto = t2.IdProduto;


SELECT *
FROM transacao_produto AS t1
LEFT JOIN produtos AS t2
ON t1.IdProduto = t2.IdProduto
WHERE t2.IdProduto IS NULL;

-- Selecionando somente a informação relevante da união que é o nome dos produtos
SELECT t1.*,
t2.DescNomeProduto
FROM transacao_produto as t1
LEFT JOIN produtos as t2
ON t1.IdProduto = t2.IdProduto;

