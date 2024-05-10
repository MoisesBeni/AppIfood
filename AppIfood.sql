

CREATE TABLE usuario (
ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
dateCreate INT,
dateTime INT,
status INT,
nome VARCHAR(60),
email VARCHAR(60)UNIQUE,
senha VARCHAR(60),
telefone VARCHAR(20),
cpf VARCHAR(11)UNIQUE
);

CREATE TABLE restaurante(
ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
dateCreate INT,
dateTime INT,
status INT,
nome VARCHAR(60), 
descricao VARCHAR(60),
telefone VARCHAR(20),
avaliacao FLOAT,
cnpj VARCHAR(30)
);

CREATE TABLE categoria_estabelecimeto(
ID  INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
dateCreate INT,
dateTime INT,
status INT,
nome VARCHAR(60),
descricao VARCHAR(60)
);

CREATE TABLE endereco(
ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
dateCreate INT,
dateTime INT,
status INT,
rua VARCHAR(60),
bairro VARCHAR(60),
cidade VARCHAR(60),
cep VARCHAR(20),
numero VARCHAR(10),
complemento VARCHAR(100),
padrao INT
);

CREATE TABLE produto(
ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
dateCreate INT,
dateTime INT,
status INT,
nome VARCHAR(60),
preco INT,
descricao VARCHAR(60)
);

CREATE TABLE categoria_produto(
ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
dateCreate INT,
dateTime INT,
status INT,
nome VARCHAR(60),
descricao VARCHAR(60)
);

CREATE TABLE adicional(
ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
dateCreate INT,
dateTime INT,
status INT,
nome VARCHAR(60),
valor INT,
descricao VARCHAR(60)
);

CREATE TABLE pedido(
ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
dateCreate INT,
dateTime INT,
status INT,
taxaEntrega INT,
valorTotal INT,
descricao VARCHAR(60)
is_retirada INT
);

CREATE TABLE status_pedido(
ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
dateCreate INT,
dateTime INT,
status INT,
nome VARCHAR(60),
descricao VARCHAR(60)
);

CREATE TABLE historico_pedido(
ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
dateCreate INT,
dateTime INT,
status INT
);

CREATE TABLE cupom(
ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
dateCreate INT,
dateTime INT,
status INT,
codigo VARCHAR(15) NOT NULL,
valor INT,
descriao VARCHAR(60),
validade INT NOT NULL
);

CREATE TABLE adicional_produto_pedido(
ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
dateCreate INT,
dateTime INT,
status INT,
quantidade INT
);

CREATE TABLE avaliacao(
ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
dateCreate INT,
dateTime INT,
status INT,
nota_restaurante INT,
nota_pedido INT,
descricao VARCHAR(60)
);

CREATE TABLE pagamento(
ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
dateCreate INT,
dateTime INT,
status INT,
valor INT NOT NULL,
data_hora INT
);

CREATE TABLE metado_pagamento(
ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
dateCreate INT,
dateTime INT,
status INT,
nome VARCHAR(60),
descricao VARCHAR(60)
);

CREATE TABLE status_pagamento(
ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
dateCreate INT,
dateTime INT,
status INT,
nome VARCHAR(60),
descricao VARCHAR(60)
);

CREATE TABLE favoritos(
ID_usuario INT,
ID_restaurante INT
);

CREATE TABLE pedido_produto(
ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
dateCreate INT,
dateTime INT,
status INT
);

CREATE TABLE funcionamento_restaurante(
ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
dateCreate INT,
dateTime INT,
status INT,
dia INT,
hora_abrir INT,
hora_fechar INT
);

CREATE TABLE adicionar_produto(
ID_produto INT,
ID_adicional INT
);

