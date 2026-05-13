CREATE DATABASE manutencao;

USE manutencao;

CREATE TABLE Maquinas (
    id_maquina INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    setor VARCHAR(50),
    data_aquisicao DATE
);


CREATE TABLE Tecnicos (
    id_tecnico INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) UNIQUE NOT NULL,
    especialidade VARCHAR(50)
);


CREATE TABLE Estoque (
    id_estoque INT PRIMARY KEY,
    quantidade_disponivel INT DEFAULT 0,
    estoque_minimo INT DEFAULT 0
);


CREATE TABLE Pecas (
    id_peca INT PRIMARY KEY,
    id_estoque INT NOT NULL,
    quantidade_utilizada INT,
    custo DECIMAL(10, 2),
    FOREIGN KEY (id_estoque) REFERENCES Estoque(id_estoque)
);

CREATE TABLE OS (
    id_os INT PRIMARY KEY,
    id_maquina INT NOT NULL,
    data_abertura DATE NOT NULL,
    data_fechamento DATE,
    status VARCHAR(20),
    FOREIGN KEY (id_maquina) REFERENCES Maquinas(id_maquina)
);

CREATE TABLE Registro_Manutencao (
    id_registro INT PRIMARY KEY,
    id_os INT NOT NULL,
    descricao TEXT,
    tempo_gasto TIME,
    FOREIGN KEY (id_os) REFERENCES OS(id_os)
);


CREATE TABLE OS_Pecas (
    id_os INT,
    id_peca INT,
    PRIMARY KEY (id_os, id_peca),
    FOREIGN KEY (id_os) REFERENCES OS(id_os),
    FOREIGN KEY (id_peca) REFERENCES Pecas(id_peca)
);


CREATE TABLE OS_Tecnicos (
    id_os INT,
    id_tecnico INT,
    PRIMARY KEY (id_os, id_tecnico),
    FOREIGN KEY (id_os) REFERENCES OS(id_os),
    FOREIGN KEY (id_tecnico) REFERENCES Tecnicos(id_tecnico)
);

select * from Maquinas;