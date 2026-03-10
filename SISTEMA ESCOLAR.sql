CREATE TABLE Professor (
    codigo INT PRIMARY KEY,
    nome VARCHAR(100),
    telefone VARCHAR(20),
    endereco VARCHAR(200)
);

CREATE TABLE Curso (
    codigo INT PRIMARY KEY,
    nome VARCHAR(100),
    duracao INT
);

CREATE TABLE Turma (
    codigo INT PRIMARY KEY,
    codigo_curso INT,
    hora_inicio TIME,
    hora_fim TIME,
    dia_semana VARCHAR(20),
    data_inicio DATE,
    nivel VARCHAR(20),
    max_vagas INT,
    codigo_professor INT,
    FOREIGN KEY (codigo_curso) REFERENCES Curso(codigo),
    FOREIGN KEY (codigo_professor) REFERENCES Professor(codigo)
);

CREATE TABLE Aluno (
    codigo INT PRIMARY KEY,
    nome VARCHAR(100),
    endereco VARCHAR(200),
    telefone VARCHAR(20)
);

CREATE TABLE Matricula (
    codigo_aluno INT,
    codigo_turma INT,
    data_matricula DATE,
    PRIMARY KEY (codigo_aluno, codigo_turma),
    FOREIGN KEY (codigo_aluno) REFERENCES Aluno(codigo),
    FOREIGN KEY (codigo_turma) REFERENCES Turma(codigo)
);