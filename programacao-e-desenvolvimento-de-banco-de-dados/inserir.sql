-- Inserindo registros na tabela "Estado"
INSERT INTO Estado (nome, uf) VALUES 
    ('São Paulo', 'SP'),
    ('Rio de Janeiro', 'RJ'),
    ('Minas Gerais', 'MG'),
    ('Bahia', 'BA');

-- Inserindo registros na tabela "Municipio"
INSERT INTO Municipio (nome, codIBGE, estado_id) VALUES 
    ('São Paulo', 3550308, 1), 
    ('Rio de Janeiro', 3304557, 2), 
    ('Belo Horizonte', 3106200, 3), 
    ('Salvador', 2927408, 4);

-- Inserindo registros na tabela "Cliente"
INSERT INTO Cliente (nome, cpf, celular, endereco_logradouro, endereco_numero, endereco_municipio, endereco_cep, municipio_id) VALUES 
    ('Maria Silva', '12345678901', '11987654321', 'Rua das Flores', '100', 1, '01001000', 1),
    ('José Souza', '98765432100', '21987654321', 'Av. Atlântica', '200', 2, '22041010', 2),
    ('Ana Oliveira', '45612378900', '31987654321', 'Praça Sete', '300', 3, '30140070', 3),
    ('Carlos Pereira', '32165498700', '71987654321', 'Rua do Dendezeiro', '400', 4, '40301460', 4);

-- Inserindo registros na tabela "ContaReceber"
INSERT INTO ContaReceber (cliente_id, fatura_venda_id, data_conta, data_vencimento, valor, situacao) VALUES 
    (1, 101, '2024-10-01', '2024-11-01', 150.50, '1'), 
    (2, 102, '2024-10-05', '2024-11-05', 300.75, '2'), 
    (3, 103, '2024-10-10', '2024-11-10', 500.00, '3'), 
    (4, 104, '2024-10-15', '2024-11-15', 250.20, '1');
