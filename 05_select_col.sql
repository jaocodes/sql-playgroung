SELECT * FROM clientes; 

SELECT * , QtdePontos + 10 FROM clientes;

SELECT * , QtdePontos + 10, QtdePontos * 2 FROM clientes;


SELECT idCliente, QtdePontos , QtdePontos + 10, QtdePontos * 2 FROM clientes;

SELECT idCliente , QtdePontos, QtdePontos + 10 AS QntdePontosPlus10 FROM clientes;

SELECT idCliente , QtdePontos, DtCriacao, QtdePontos + 10 AS QntdePontosPlus10 FROM clientes;

SELECT idCliente, DtCriacao FROM clientes;

SELECT idCliente,
DtCriacao,
datetime(DtCriacao)
FROM clientes;

SELECT idCliente,
DtCriacao,
substr(DtCriacao,1,10) AS dtCriacaoMod
FROM clientes;


SELECT idCliente,
DtCriacao,
datetime( substr(DtCriacao,1,10) ) AS dtCriacaoMod
FROM clientes;



SELECT idCliente,
DtCriacao,
datetime(DtCriacao),
strftime('%w', datetime(DtCriacao)) AS diaSemana
FROM clientes;