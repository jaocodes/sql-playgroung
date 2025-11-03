SELECT * FROM relatorio_diario;


UPDATE relatorio_diario
SET qntdTransacao = 10000
WHERE dtDia >= '2025-08-25';

SELECT * FROM relatorio_diario;
