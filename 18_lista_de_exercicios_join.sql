-- Quais clientes mais perderam pontos por Lover?
SELECT
    t1.IdCliente,
    sum(t2.vlProduto)
FROM transacoes AS t1

LEFT JOIN transacao_produto AS t2
ON t1.IdTransacao = t2.IdTransacao

LEFT JOIN produtos AS t3
ON t2.IdProduto = t3.IdProduto

WHERE t3.DescCategoriaProduto = 'lovers'

GROUP BY t1.idCliente
ORDER BY sum(t2.vlProduto) ASC
LIMIT 5;

-- Quais clientes assinaram a lista de presença no dia 2025/08/25?
SELECT t1.idCliente,
t1.DtCriacao,
t3.DescNomeProduto

FROM transacoes AS t1

LEFT JOIN transacao_produto AS t2
ON t1.IdTransacao = t2.IdTransacao

LEFT JOIN produtos AS t3
ON t2.IdProduto = t3.IdProduto

WHERE substr(t1.DtCriacao,1,10) = '2025-08-25'
AND DescNomeProduto = 'Lista de presença';

-- Do início ao fim do nosso curso (2025/08/25 a 2025/08/29), quantos clientes assinaram a lista de presença?
SELECT count(DISTINCT t1.idCliente)

FROM transacoes AS t1

LEFT JOIN transacao_produto AS t2
ON t1.IdTransacao = t2.IdTransacao

LEFT JOIN produtos AS t3
ON t2.IdProduto = t3.IdProduto

WHERE t1.DtCriacao >= '2025-08-25'
AND t1.DtCriacao < '2025-08-30'
AND DescNomeProduto = 'Lista de presença';

-- Clientes mais antigos, tem mais frequência de transação?
SELECT  t1.idCliente,
        julianday('now') - julianday(substr(t1.DtCriacao,1,19)) AS diffDateNow,
        count(t2.IdTransacao)
FROM clientes AS t1

LEFT JOIN transacoes AS t2
ON t1.idCliente = t2.idCliente

GROUP BY t1.idCliente, diffDateNow;


-- Quantidade de transações Acumuladas ao longo do tempo?
-- Quantidade de usuários cadastrados (absoluto e acumulado) ao longo do tempo?
-- Qual o dia da semana mais ativo de cada usuário?
-- Saldo de pontos acumulado de cada usuário
