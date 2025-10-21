SELECT * FROM transacao_produto
WHERE IdProduto = 15;


SELECT IdProduto 
FROM produtos
WHERE DescNomeProduto = 'Resgatar Ponei';



SELECT *

FROM transacao_produto AS t1

WHERE t1.IdProduto IN (
    SELECT IdProduto 
    FROM produtos
    WHERE DescNomeProduto = 'Resgatar Ponei'
);



-- Bora praticar

SELECT DISTINCT IdCliente 
FROM transacoes 
WHERE substr(DtCriacao, 1,10) = '2025-08-25';


SELECT count(DISTINCT idCliente)
FROM transacoes AS t1
WHERE t1.IdCliente IN (
SELECT DISTINCT IdCliente 
FROM transacoes 
WHERE substr(DtCriacao, 1,10) = '2025-08-25'
) 
AND
substr(t1.DtCriacao,1,10) = '2025-08-29';
