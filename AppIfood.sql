

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
/* NESSA PARTE DO GODIGO SERA FEITA AS ALTERAÇÕES DAS TABELAS */
*
/* TABELA RESTAURANTE*/
ALTER TABLE restaurante
ADD CONSTRAINT categoria_estabelecimeto_FK
FOREIGN KEY (categoria_estabelecimeto_ID) REFERENCES categoria_estabelecimeto (ID);
/*TABELA ENDEREÇO*/
ALTER TABLE endereco
ADD CONSTRAINT usuario_FK
FOREIGN KEY (ID_usuario) REFERENCES usuario(ID);
ALTER TABLE endereco
ADD CONSTRAINT restaurante_FK
FOREIGN KEY (ID_restaurante) REFERENCES restaurante(ID);
*
/*TABELA PRODUTO*/
ALTER TABLE produto
ADD CONSTRAINT categoria_produto_FK
FOREIGN KEY (categoria_produto_ID) REFERENCES categoria_produto(ID);
ALTER TABLE produto
ADD CONSTRAINT restaurante_FK
FOREIGN KEY (ID_restaurante) REFERENCES restaurante(ID);
*
/*TABELA AVALIAÇÃO*/
ALTER TABLE avaliacao
ADD CONSTRAINT pedido_FK
FOREIGN KEY (pedido_ID) REFERENCES pedido(ID);
*
/*TABELA PEDIDO*/
ALTER TABLE pedido
ADD CONSTRAINT endereco_FK
FOREIGN KEY (endereco_ID) REFERENCES endereco(ID);
ALTER TABLE pedido
ADD CONSTRAINT usuario_FK
FOREIGN KEY(ID_usuario) REFERENCES usuario(ID);
ALTER TABLE pedido
ADD CONSTRAINT restaurante_FK
FOREIGN KEY(ID_restaurante) REFERENCES restaurante(ID);
ALTER TABLE pedido
ADD CONSTRAINT cupom_FK
FOREIGN KEY (cupom_ID) REFERENCES cupom(ID);
ALTER TABLE pedido
ADD CONSTRAINT status_pedido_FK
FOREIGN KEY (status_pedido_ID) REFERENCES status_pedido(ID);
*
/*TABELA ADICIONAR PRODUTO*/
ALTER TABLE adicionar_produto
ADD CONSTRAINT adicional_FK
FOREIGN KEY (adicional_ID) REFERENCES adicional(ID);
ALTER TABLE adicionar_produto
ADD CONSTRAINT produto_FK
FOREIGN KEY (ID_produto) REFERENCES produto(ID);
*
/*TABELA FAVORITOS*/
ALTER TABLE favoritos
ADD CONSTRAINT usuario_FK
FOREIGN KEY (ID_usuario) REFERENCES usuario(ID);
ALTER TABLE favoritos
ADD CONSTRAINT restaurante_FK
FOREIGN KEY (ID_restaurante) REFERENCES restaurante(ID);
*
/*TABELA PEDIDO-PRODUTO*/
ALTER TABLE pedido_produto
ADD CONSTRAINT pedido_FK
FOREIGN KEY (pedido_ID) REFERENCES pedido(ID);
ALTER TABLE pedido_produto
ADD CONSTRAINT produto_FK
FOREIGN KEY (ID_produto) REFERENCES produto(ID);
*
/*TABELA ADICIONAL-PRODUTO-PEDIDO*/
ALTER TABLE adicional_produto_pedido
ADD CONSTRAINT pedido_produto_FK
FOREIGN KEY (pedido_produto_ID) REFERENCES pedido_produto(ID);
ALTER TABLE adicional_produto_pedido
ADD CONSTRAINT adicional_FK
FOREIGN KEY (adicional_ID) REFERENCES adicional(ID);
*
/*TABELA HISTORICO PEDIDO*/
ALTER TABLE historico_pedido
ADD CONSTRAINT pedido_FK
FOREIGN KEY (pedido_ID) REFERENCES pedido(ID);
ALTER TABLE historico_pedido
ADD CONSTRAINT status_pedido_FK
FOREIGN KEY (status_pedido_ID) REFERENCES status_pedido(ID);
*
/*TABELA PAGAMENTO*/
ALTER TABLE pagamento
ADD CONSTRAINT pedido_FK
FOREIGN KEY (pedido_ID) REFERENCES pedido(ID);
ALTER TABLE pagamento
ADD CONSTRAINT metado_pagamento_FK
FOREIGN KEY (metado_pagamento_ID) REFERENCES metado_pagamento(ID);
ALTER TABLE pagamento
ADD CONSTRAINT status_pagamento_FK
FOREIGN KEY (status_pagamento_ID) REFERENCES status_pagamento(ID);
*
/* TABELA FUNCIONAMENTO*/
ALTER TABLE funcionamento_restaurante
ADD CONSTRAINT restaurante_FK
FOREIGN KEY (ID_restaurante) REFERENCES restaurante(ID);