CREATE TABLE AreaConhecimento (
    codigo INT PRIMARY KEY,
    descricao VARCHAR(100)
);

CREATE TABLE Editora (
    codigo INT PRIMARY KEY,
    nome VARCHAR(100),
    telefone VARCHAR(20),
    endereco VARCHAR(200)
);

CREATE TABLE Autor (
    codigo INT PRIMARY KEY,
    nome VARCHAR(100),
    telefone VARCHAR(20),
    endereco VARCHAR(200)
);

CREATE TABLE Titulo (
    codigo INT PRIMARY KEY,
    nome VARCHAR(150),
    codigo_area INT,
    codigo_editora INT,
    FOREIGN KEY (codigo_area) REFERENCES AreaConhecimento(codigo),
    FOREIGN KEY (codigo_editora) REFERENCES Editora(codigo)
);

CREATE TABLE Exemplar (
    codigo INT PRIMARY KEY,
    codigo_titulo INT,
    FOREIGN KEY (codigo_titulo) REFERENCES Titulo(codigo)
);

CREATE TABLE TituloAutor (
    codigo_titulo INT,
    codigo_autor INT,
    PRIMARY KEY (codigo_titulo, codigo_autor),
    FOREIGN KEY (codigo_titulo) REFERENCES Titulo(codigo),
    FOREIGN KEY (codigo_autor) REFERENCES Autor(codigo)
);

CREATE TABLE Usuario (
    codigo INT PRIMARY KEY,
    nome VARCHAR(100),
    telefone VARCHAR(20),
    endereco VARCHAR(200)
);

CREATE TABLE Emprestimo (
    codigo_exemplar INT,
    codigo_usuario INT,
    data_emprestimo DATE,
    PRIMARY KEY (codigo_exemplar, codigo_usuario, data_emprestimo),
    FOREIGN KEY (codigo_exemplar) REFERENCES Exemplar(codigo),
    FOREIGN KEY (codigo_usuario) REFERENCES Usuario(codigo)
);

CREATE TABLE PalavraChave (
    codigo INT PRIMARY KEY,
    descricao VARCHAR(100)
);

CREATE TABLE TituloPalavra (
    codigo_titulo INT,
    codigo_palavra INT,
    PRIMARY KEY (codigo_titulo, codigo_palavra),
    FOREIGN KEY (codigo_titulo) REFERENCES Titulo(codigo),
    FOREIGN KEY (codigo_palavra) REFERENCES PalavraChave(codigo)
);