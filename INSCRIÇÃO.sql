CREATE TABLE Aluno (
    codigo_aluno INT PRIMARY KEY,
    nome VARCHAR(100),
    telefone VARCHAR(20),
    ano_admissao INT
);

CREATE TABLE Curso (
    codigo_curso INT PRIMARY KEY,
    nome VARCHAR(100)
);

CREATE TABLE Disciplina (
    codigo_disciplina INT PRIMARY KEY,
    nome VARCHAR(100),
    codigo_curso INT,
    FOREIGN KEY (codigo_curso) REFERENCES Curso(codigo_curso)
);

CREATE TABLE Inscricao (
    codigo_aluno INT,
    codigo_disciplina INT,
    data_matricula DATE,
    PRIMARY KEY (codigo_aluno, codigo_disciplina),
    FOREIGN KEY (codigo_aluno) REFERENCES Aluno(codigo_aluno),
    FOREIGN KEY (codigo_disciplina) REFERENCES Disciplina(codigo_disciplina)
);