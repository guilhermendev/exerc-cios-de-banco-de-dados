CREATE TABLE Hotel (
    codigo INT PRIMARY KEY,
    localizacao VARCHAR(150),
    num_quartos INT,
    classificacao_embratur INT,
    alimentacao BOOLEAN,
    valor_hospedagem DECIMAL(10,2)
);

CREATE TABLE OperadoraTransporte (
    codigo INT PRIMARY KEY,
    nome VARCHAR(100),
    trajeto VARCHAR(150),
    num_assentos INT,
    tipo VARCHAR(20)
);

CREATE TABLE TransporteAereo (
    codigo INT PRIMARY KEY,
    restricao_volume VARCHAR(100),
    taxa_embarque DECIMAL(10,2),
    FOREIGN KEY (codigo) REFERENCES OperadoraTransporte(codigo)
);

CREATE TABLE TransporteTerrestre (
    codigo INT PRIMARY KEY,
    minimo_assentos INT,
    FOREIGN KEY (codigo) REFERENCES OperadoraTransporte(codigo)
);

CREATE TABLE PrestadorServico (
    codigo INT PRIMARY KEY,
    nome VARCHAR(100),
    telefone VARCHAR(20),
    email VARCHAR(100),
    cnpj VARCHAR(20)
);

CREATE TABLE Servico (
    codigo INT PRIMARY KEY,
    descricao VARCHAR(200),
    valor DECIMAL(10,2),
    codigo_prestador INT,
    FOREIGN KEY (codigo_prestador) REFERENCES PrestadorServico(codigo)
);

CREATE TABLE Pacote (
    codigo INT PRIMARY KEY,
    codigo_hotel INT,
    codigo_transporte INT,
    data_inicio DATE,
    condicoes_pagamento VARCHAR(200),
    num_vagas INT,
    FOREIGN KEY (codigo_hotel) REFERENCES Hotel(codigo),
    FOREIGN KEY (codigo_transporte) REFERENCES OperadoraTransporte(codigo)
);

CREATE TABLE AtividadePacote (
    codigo INT PRIMARY KEY,
    codigo_pacote INT,
    codigo_servico INT,
    data_atividade DATE,
    hora_inicio TIME,
    hora_fim TIME,
    codigo_transporte INT,
    FOREIGN KEY (codigo_pacote) REFERENCES Pacote(codigo),
    FOREIGN KEY (codigo_servico) REFERENCES Servico(codigo),
    FOREIGN KEY (codigo_transporte) REFERENCES OperadoraTransporte(codigo)
);

CREATE TABLE Cliente (
    codigo INT PRIMARY KEY,
    nome VARCHAR(100)
);

CREATE TABLE Reserva (
    codigo INT PRIMARY KEY,
    codigo_cliente INT,
    codigo_pacote INT,
    num_pessoas INT,
    forma_pagamento VARCHAR(50),
    FOREIGN KEY (codigo_cliente) REFERENCES Cliente(codigo),
    FOREIGN KEY (codigo_pacote) REFERENCES Pacote(codigo)
);