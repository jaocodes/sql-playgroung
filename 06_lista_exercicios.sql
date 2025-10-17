-- Lista de transações com apenas 1 ponto
SELECT IdTransacao, QtdePontos FROM transacoes WHERE QtdePontos = 1;

-- Lista de pedidos realizados no fim de semana
SELECT IdTransacao, strftime('%w', DtCriacao) AS weekDay
FROM transacoes WHERE weekDay IN ('0', '6');

--Lista de clientes com 0 pontos
SELECT IdCliente, QtdePontos FROM clientes WHERE QtdePontos =0;

-- Lista de clientes com pontos entre 100 e 200 (inclusive ambos)
SELECT IdCliente, QtdePontos FROM clientes WHERE QtdePontos >= 100 AND QtdePontos <=200;

-- Lista de produtos com nome que começa com 'Venda de'
SELECT IdProduto, DescNomeProduto  FROM produtos WHERE DescNomeProduto LIKE 'Venda de%';

-- Lista de produtos com nome que termina com 'Lover'
SELECT IdProduto, DescNomeProduto  FROM produtos WHERE DescNomeProduto LIKE '%Lover';

--Lista de produtos que são 'chapéu'
SELECT IdProduto, DescNomeProduto  FROM produtos WHERE DescNomeProduto LIKE '%Chapéu%';

-- Lista de transações com o produto 'Resgatar Ponei' - Id Produto 15
SELECT * FROM produtos WHERE DescNomeProduto LIKE '%Resgatar Ponei%' ;
SELECT * FROM transacao_produto WHERE IdProduto = 15;