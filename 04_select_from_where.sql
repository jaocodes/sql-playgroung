-- SELECT * FROM 'produtos' WHERE DescCategoriaProduto = 'rpg' LIMIT 10;

SELECT * FROM clientes WHERE flEmail = 1;

SELECT * FROM transacoes WHERE qtdePontos = 50;

SELECT idCliente, qtdePontos FROM transacoes WHERE qtdePontos > 500;

SELECT DescNomeProduto FROM produtos 
WHERE DescNomeProduto = 'Churn_10pp' 
OR DescNomeProduto = 'Churn_2pp'
OR DescNomeProduto = 'Churn_5pp';

SELECT DescNomeProduto FROM produtos
WHERE DescNomeProduto IN ('Churn_10pp', 'Churn_2pp', 'Churn_5pp');


SELECT DescNomeProduto FROM produtos
WHERE DescNomeProduto LIKE '%Churn%';