-- Qual categoria tem mais produtos vendidos ?
SELECT  t2.DescCategoriaProduto,
        count( DISTINCT t1.IdTransacao)

FROM transacao_produto AS t1

LEFT JOIN produtos AS t2
ON t1.IdProduto = t2.IdProduto

GROUP BY t2.DescCategoriaProduto -- GROP BY pode ser usado após o JOIN em cima da tabela do SELECT
ORDER BY count(DISTINCT t1.IdTransacao) DESC;


-- Em 2024 quantas transações de lovers tivemos?
SELECT  count(DISTINCT t1.IdTransacao) --após a filtragem do Where é feito o select da consulta

FROM transacoes AS t1

LEFT JOIN transacao_produto as t2    --join na tabela transacao_produto para unir o idProduto
ON t1.IdTransacao = t2.IdTransacao

LEFT JOIN produtos as t3             --join na tabela produtos para unir a categoriaProdutos
ON t2.IdProduto = t3.IdProduto

WHERE substr(t1.DtCriacao,1,4) = '2024'  -- filtro é aplicado após os Joins 
AND t3.DescCategoriaProduto = 'lovers'; 


SELECT  t3.DescCategoriaProduto,
        count(DISTINCT t1.IdTransacao) --após a filtragem do Where é feito o select da consulta

FROM transacoes AS t1

LEFT JOIN transacao_produto as t2    --join na tabela transacao_produto para unir o idProduto
ON t1.IdTransacao = t2.IdTransacao

LEFT JOIN produtos as t3             --join na tabela produtos para unir a categoriaProdutos
ON t2.IdProduto = t3.IdProduto

WHERE substr(t1.DtCriacao,1,4) = '2024'  -- filtro é aplicado após os Joins 
GROUP BY t3.DescCategoriaProduto

-- Qual mês tivemos mais lista de presença assinada?


SELECT substr(t1.DtCriacao,1,7) AS anoMes,
        count(DISTINCT t1.IdTransacao) AS qntDeTransacoes

FROM transacoes AS t1

LEFT JOIN transacao_produto AS t2
ON t1.IdTransacao = t2.IdTransacao

LEFT JOIN produtos AS t3
ON t2.IdProduto = t3.IdProduto

WHERE DescNomeProduto = 'Lista de presença'

GROUP BY substr(t1.DtCriacao,1,7)
ORDER BY qntDeTransacoes DESC;

