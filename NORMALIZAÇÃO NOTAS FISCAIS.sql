CREATE TABLE Cliente (
    codigo_cliente INT PRIMARY KEY,
    nome VARCHAR(100),
    endereco VARCHAR(200),
    cpf VARCHAR(14)
);

CREATE TABLE NotaFiscal (
    num_nf INT PRIMARY KEY,
    serie VARCHAR(10),
    data_emissao DATE,
    codigo_cliente INT,
    total_geral DECIMAL(10,2),
    FOREIGN KEY (codigo_cliente) REFERENCES Cliente(codigo_cliente)
);

CREATE TABLE Mercadoria (
    codigo_mercadoria INT PRIMARY KEY,
    descricao VARCHAR(200),
    preco_venda DECIMAL(10,2)
);

CREATE TABLE ItemNota (
    num_nf INT,
    codigo_mercadoria INT,
    quantidade INT,
    total_venda DECIMAL(10,2),
    PRIMARY KEY (num_nf, codigo_mercadoria),
    FOREIGN KEY (num_nf) REFERENCES NotaFiscal(num_nf),
    FOREIGN KEY (codigo_mercadoria) REFERENCES Mercadoria(codigo_mercadoria)
);