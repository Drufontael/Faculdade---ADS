-- Tabela Endereco
CREATE TABLE ENDERECO (
    cep VARCHAR(9) PRIMARY KEY,
    logradouro VARCHAR(100),
    bairro VARCHAR(50),
    cidade VARCHAR(50),
    uf CHAR(2),
    pais VARCHAR(50)
);

-- Tabela Especialidade
CREATE TABLE ESPECIALIDADE (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT
);

-- Tabela Paciente
CREATE TABLE PACIENTE (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(11) NOT NULL UNIQUE,
    data_nascimento DATE NOT NULL,
    sexo ENUM('Masculino', 'Feminino', 'Outro') NOT NULL,
    cep VARCHAR(9),
    numero_residencia INT,
    complemento VARCHAR(50),
    telefone VARCHAR(15),
    FOREIGN KEY (cep) REFERENCES ENDERECO(cep)
);

-- Tabela Medico
CREATE TABLE MEDICO (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    crm VARCHAR(10) NOT NULL UNIQUE,
    id_especialidade INT,
    cep VARCHAR(9),
    numero_residencia INT,
    complemento VARCHAR(50),
    telefone VARCHAR(15),
    FOREIGN KEY (cep) REFERENCES ENDERECO(cep),
    FOREIGN KEY (id_especialidade) REFERENCES ESPECIALIDADE(id)
);

-- Tabela Tratamento
CREATE TABLE TRATAMENTO (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    id_especialidade INT,
    FOREIGN KEY (id_especialidade) REFERENCES ESPECIALIDADE(id)
);

-- Tabela Consulta
CREATE TABLE CONSULTA (
    id INT AUTO_INCREMENT PRIMARY KEY,
    data DATE NOT NULL,
    id_paciente INT,
    id_medico INT,
    FOREIGN KEY (id_paciente) REFERENCES PACIENTE(id),
    FOREIGN KEY (id_medico) REFERENCES MEDICO(id)
);

-- Tabela Consulta_Tratamento (Relacionamento muitos-para-muitos)
CREATE TABLE CONSULTA_TRATAMENTO (
    id_consulta INT,
    id_tratamento INT,
    PRIMARY KEY (id_consulta, id_tratamento),
    FOREIGN KEY (id_consulta) REFERENCES CONSULTA(id),
    FOREIGN KEY (id_tratamento) REFERENCES TRATAMENTO(id)
);

-- Tabela Internacao
CREATE TABLE INTERNACAO (
    id INT AUTO_INCREMENT PRIMARY KEY,
    data_entrada DATE NOT NULL,
    data_saida DATE,
    leito VARCHAR(10),
    id_paciente INT,
    FOREIGN KEY (id_paciente) REFERENCES PACIENTE(id)
);

-- Tabela Internacao_Tratamento (Relacionamento muitos-para-muitos)
CREATE TABLE INTERNACAO_TRATAMENTO (
    id_internacao INT,
    id_tratamento INT,
    PRIMARY KEY (id_internacao, id_tratamento),
    FOREIGN KEY (id_internacao) REFERENCES INTERNACAO(id),
    FOREIGN KEY (id_tratamento) REFERENCES TRATAMENTO(id)
);
