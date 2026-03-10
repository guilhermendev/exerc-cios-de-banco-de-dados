CREATE TABLE Orquestra (
    codigo INT PRIMARY KEY,
    nome VARCHAR(100),
    cidade VARCHAR(100),
    pais VARCHAR(100),
    data_criacao DATE
);

CREATE TABLE Sinfonia (
    codigo INT PRIMARY KEY,
    nome VARCHAR(100),
    compositor VARCHAR(100),
    data_criacao DATE
);

CREATE TABLE Musico (
    codigo INT PRIMARY KEY,
    nome VARCHAR(100),
    identidade VARCHAR(20),
    nacionalidade VARCHAR(50),
    data_nascimento DATE,
    codigo_orquestra INT,
    funcao VARCHAR(50),
    FOREIGN KEY (codigo_orquestra) REFERENCES Orquestra(codigo)
);

CREATE TABLE Apresentacao (
    codigo_musico INT,
    codigo_sinfonia INT,
    funcao VARCHAR(50),
    data_apresentacao DATE,
    PRIMARY KEY (codigo_musico, codigo_sinfonia, data_apresentacao),
    FOREIGN KEY (codigo_musico) REFERENCES Musico(codigo),
    FOREIGN KEY (codigo_sinfonia) REFERENCES Sinfonia(codigo)
);