create database loja_eletronico;

use loja_eletronico;

CREATE TABLE cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(11) UNIQUE NOT NULL,
    telefone VARCHAR(11) UNIQUE
);

CREATE TABLE venda (
    id_venda INT AUTO_INCREMENT PRIMARY KEY,
    fk_idCliente INT,
    data_venda DATE,
    valor_total DECIMAL(5 , 2 ) NOT NULL,
    FOREIGN KEY (fk_idCliente)
        REFERENCES cliente (id_cliente)
);

CREATE TABLE produto (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    preco DECIMAL(5 , 2 ) NOT NULL,
    categoria VARCHAR(100) NOT NULL,
    marca VARCHAR(100)
);

CREATE TABLE item_venda (
    id_venda INT,
    id_produto INT,
    quantidade INT,
    preco_unitario DECIMAL(10 , 2 ),
    PRIMARY KEY (id_venda , id_produto),
    FOREIGN KEY (id_venda)
        REFERENCES venda (id_venda),
    FOREIGN KEY (id_produto)
        REFERENCES produto (id_produto)
);

CREATE TABLE estoque (
    id_estoque INT AUTO_INCREMENT PRIMARY KEY,
    quantidade INT NOT NULL,
    fk_idProduto INT,
    FOREIGN KEY (fk_idProduto)
        REFERENCES produto (id_produto)
);


CREATE TABLE pagamento (
    id_pagamento INT AUTO_INCREMENT PRIMARY KEY,
    fk_idVenda INT,
    tipo_pagamento varchar(100),
    valor_total DECIMAL(10 , 2 ) NOT NULL,
    FOREIGN KEY (fk_idVenda)
        REFERENCES venda (id_venda)
);

select * from pagamento;