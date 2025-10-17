-- Intervalos
-- de 0 a 500      -> Ponei
-- de 501 a 1000   -> Ponei Premium
-- de 1001 a 5000  -> Mago Aprendiz
-- de 5001 a 10000 -> Mago Mestre
-- mais de 10001   -> Mago Supremo


SELECT idCliente,
qtdePontos,
        CASE
            WHEN qtdePontos <= 500 THEN 'Ponei'
            WHEN qtdePontos > 500 AND qtdePontos <= 1000 THEN 'Ponei Premium'
            WHEN qtdePontos > 1000 AND qtdePontos <= 5000 THEN 'Mago Aprendiz'
            WHEN qtdePontos > 5000 AND qtdePontos <= 10000 THEN 'Mago Mestre'
            WHEN qtdePontos > 10000 THEN 'Mago Supremo'
        END as nomeGrupo

FROM clientes

ORDER BY qtdePontos DESC;


SELECT idCliente,
qtdePontos,
        CASE
            WHEN qtdePontos <= 500 THEN 'Ponei'
            WHEN qtdePontos > 500 AND qtdePontos <= 1000 THEN 'Ponei Premium'
            WHEN qtdePontos > 1000 AND qtdePontos <= 5000 THEN 'Mago Aprendiz'
            WHEN qtdePontos > 5000 AND qtdePontos <= 10000 THEN 'Mago Mestre'
            ELSE 'Mago Supremo'
        END as nomeGrupo

FROM clientes

ORDER BY qtdePontos DESC;


SELECT idCliente,
qtdePontos,
        CASE
            WHEN qtdePontos <= 1000 THEN 1
            ELSE 0
        END as flPonei,
        CASE
            WHEN qtdePontos > 1000 THEN 1
            ELSE 0
        END as flMago
FROM clientes
ORDER BY qtdePontos DESC;