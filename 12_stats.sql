SELECT avg(qtdePontos)
FROM clientes;

SELECT sum(qtdePontos) / count(qtdePontos)
FROM clientes;

SELECT 1. * sum(qtdePontos) / count(qtdePontos)
FROM clientes;

SELECT round(avg(qtdePontos), 3)
FROM clientes;

SELECT 
min(qtdePontos) AS minCarteira,
max(qtdePontos) AS maxCarteira
FROM clientes;

SELECT sum(flEmail) as qtdClientesEmail,
sum(flTwitch) as qtdClientesTwitch
FROM clientes;

