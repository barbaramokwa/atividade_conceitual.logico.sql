create database cinema;

use cinema;

CREATE TABLE cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    rg VARCHAR(11) NOT NULL UNIQUE,
    data_nascimento DATE
);

CREATE TABLE pedido (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    tipo_pagamento ENUM('Dinheiro', 'PIX', 'cartão') DEFAULT 'pix',
    fk_idCliente int,
    data_pagamento DATE,
    foreign key(fk_idCliente) references cliente(id_cliente)
);

CREATE TABLE ingresso (
    id_ingresso INT AUTO_INCREMENT PRIMARY KEY,
    fk_idPedido INT,
    fk_idTipo INT,
    fk_idSessao INT,
    FOREIGN KEY (fk_idPedido)
        REFERENCES pedido (id_pedido),
    FOREIGN KEY (fk_idTipo)
        REFERENCES tipoIngresso (id_tipo),
	FOREIGN KEY (fk_idSessao) 
		REFERENCES sessao (id_sessao)
);

CREATE TABLE tipoIngresso (
    id_tipo INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(100),
    valor DECIMAL(10 , 2 )
);

CREATE TABLE sessao (
    id_sessao INT AUTO_INCREMENT PRIMARY KEY,
    horario TIME,
    fk_idFilme int,
    fk_idSala int,
    foreign key (fk_idFilme) references filme(id_filme),
    foreign key (fk_idSala) references sala(id_sala)
);

CREATE TABLE filme (
    id_filme INT AUTO_INCREMENT PRIMARY KEY,
    nome_filme VARCHAR(100),
    categoria VARCHAR(100),
    faixa_etaria INT CHECK (faixa_etaria > 0)
);

CREATE TABLE sala (
    id_sala INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(100),
    categoria VARCHAR(100)
);

select * from pedido;