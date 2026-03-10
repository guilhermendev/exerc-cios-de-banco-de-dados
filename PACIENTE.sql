CREATE TABLE Medico (
    cod_medico INT PRIMARY KEY,
    nome_medico VARCHAR(100),
    fone_medico VARCHAR(20)
);

CREATE TABLE Quarto (
    num_quarto INT PRIMARY KEY,
    descricao VARCHAR(100),
    num_comodos INT
);

CREATE TABLE Paciente (
    num_paciente INT PRIMARY KEY,
    nome_paciente VARCHAR(100),
    num_quarto INT,
    cod_medico INT,
    FOREIGN KEY (num_quarto) REFERENCES Quarto(num_quarto),
    FOREIGN KEY (cod_medico) REFERENCES Medico(cod_medico)
);