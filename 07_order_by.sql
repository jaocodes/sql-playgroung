-- Por padrão o ORDER BY trás os dados ordenados de forma ascendente (ASC)
SELECT * FROM clientes ORDER BY QtdePontos DESC LIMIT 10; 


SELECT * FROM clientes ORDER BY DtCriacao ASC, qtdePontos DESC;

SELECT * FROM clientes
WHERE flTwitch = 1
ORDER BY DtCriacao ASC, qtdePontos DESC;