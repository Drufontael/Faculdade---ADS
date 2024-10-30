CREATE VIEW vw_ContasNaoPagas AS
SELECT 
    cr.ID AS ContaID,
    c.Nome AS NomeCliente,
    c.CPF AS CPFCliente,
    cr.DataVencimento,
    cr.Valor
FROM 
    ContaReceber cr
JOIN 
    Cliente c ON cr.Cliente_ID = c.ID
WHERE 
    cr.Situacao = '1';

SELECT * FROM vw_ContasNaoPagas;
