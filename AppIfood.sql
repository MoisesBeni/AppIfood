

CREATE TABLE usuario (
ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
date_Create datetime,
status INT,
nome VARCHAR(60),
email VARCHAR(60)UNIQUE,
senha VARCHAR(60),
telefone VARCHAR(20),
cpf VARCHAR(11)UNIQUE
);

CREATE TABLE restaurante(
ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
date_Create datetime,
status INT,
nome VARCHAR(60), 
descricao VARCHAR(60),
telefone VARCHAR(20),
avaliacao FLOAT,
cnpj VARCHAR(30),
categoria_estabelecimento_ID INT
);

CREATE TABLE categoria_estabelecimeto(
ID  INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
date_Create datetime,
status INT,
nome VARCHAR(60),
descricao VARCHAR(60)
);

CREATE TABLE endereco(
ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
date_Create datetime,
status INT,
rua VARCHAR(60),
bairro VARCHAR(60),
cidade VARCHAR(60),
cep VARCHAR(20),
numero VARCHAR(10),
complemento VARCHAR(100),
padrao INT,
ID_usuario INT,
ID_restaurante INT
);

CREATE TABLE produto(
ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
date_Create datetime,
status INT,
nome VARCHAR(60),
preco INT,
descricao VARCHAR(60),
categoria_produto_ID INT,
ID_restaurante INT
);

CREATE TABLE categoria_produto(
ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
date_Create datetime,
status INT,
nome VARCHAR(60),
descricao VARCHAR(60)
);

CREATE TABLE adicional(
ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
date_Create datetime,
status INT,
nome VARCHAR(60),
valor INT,
descricao VARCHAR(60)
);

CREATE TABLE pedido(
ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
date_Create datetime,
status INT,
taxaEntrega INT,
valorTotal INT,
descricao VARCHAR(60),
is_retirada INT,
endereco_ID INT,
ID_usuario INT,
ID_restaurante INT,
cupom_ID INT,
status_pedido_ID INT
);

CREATE TABLE status_pedido(
ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
date_Create datetime,
status INT,
nome VARCHAR(60),
descricao VARCHAR(60)
);

CREATE TABLE historico_pedido(
ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
date_Create datetime,
status INT,
pedido_ID INT,
status_pedido_ID INT
);

CREATE TABLE cupom(
ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
date_Create datetime,
status INT,
codigo VARCHAR(15) NOT NULL,
valor INT,
descriao VARCHAR(60),
validade INT NOT NULL
);

CREATE TABLE adicional_produto_pedido(
ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
date_Create datetime,
status INT,
quantidade INT,
pedido_produto_ID INT,
adicional_ID INT
);

CREATE TABLE avaliacao(
ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
date_Create datetime,
status INT,
nota_restaurante INT,
nota_pedido INT,
descricao VARCHAR(60),
pedido_ID INT
);

CREATE TABLE pagamento(
ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
date_Create datetime,
status INT,
valor INT NOT NULL,
data_hora VARCHAR(60),
pedido_ID INT,
metado_pagamento_ID INT,
status_pagamento_ID INT
);

CREATE TABLE metado_pagamento(
ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
date_Create datetime,
status INT,
nome VARCHAR(60),
descricao VARCHAR(60)
);

CREATE TABLE status_pagamento(
ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
date_Create datetime,
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
date_Create datetime,
status INT,
pedido_ID INT,
ID_produto INT
);

CREATE TABLE funcionamento_restaurante(
ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
date_Create datetime,
status INT,
dia INT,
hora_abrir INT,
hora_fechar INT,
ID_restaurante INT
);

CREATE TABLE adicionar_produto(
ID_produto INT,
ID_adicional INT
);

/* NESSA PARTE DO GODIGO SERA FEITA AS ALTERAÇÕES DAS TABELAS */


/* TABELA RESTAURANTE*/
ALTER TABLE restaurante
ADD CONSTRAINT categoria_estabelecimeto_FK
FOREIGN KEY (categoria_estabelecimento_ID) REFERENCES categoria_estabelecimeto (ID);

/*TABELA ENDEREÇO*/
ALTER TABLE endereco
ADD CONSTRAINT usuario_FK
FOREIGN KEY (ID_usuario) REFERENCES usuario(ID);
ALTER TABLE endereco
ADD CONSTRAINT restaurante_FK
FOREIGN KEY (ID_restaurante) REFERENCES restaurante(ID);

/*TABELA PRODUTO*/
ALTER TABLE produto
ADD CONSTRAINT categoria_produto_FK
FOREIGN KEY (categoria_produto_ID) REFERENCES categoria_produto(ID);
ALTER TABLE produto
ADD CONSTRAINT produto_restaurante_FK
FOREIGN KEY (ID_restaurante) REFERENCES restaurante(ID);

/*TABELA AVALIAÇÃO*/
ALTER TABLE avaliacao
ADD CONSTRAINT pedido_FK
FOREIGN KEY (pedido_ID) REFERENCES pedido(ID);

/*TABELA PEDIDO*/
ALTER TABLE pedido
ADD CONSTRAINT endereco_FK
FOREIGN KEY (endereco_ID) REFERENCES endereco(ID);
ALTER TABLE pedido
ADD CONSTRAINT pedido_usuario_FK
FOREIGN KEY(ID_usuario) REFERENCES usuario(ID);
ALTER TABLE pedido
ADD CONSTRAINT pedido_restaurante_FK
FOREIGN KEY(ID_restaurante) REFERENCES restaurante(ID);
ALTER TABLE pedido
ADD CONSTRAINT cupom_FK
FOREIGN KEY (cupom_ID) REFERENCES cupom(ID);
ALTER TABLE pedido
ADD CONSTRAINT status_pedido_FK
FOREIGN KEY (status_pedido_ID) REFERENCES status_pedido(ID);

/*TABELA ADICIONAR PRODUTO*/
ALTER TABLE adicionar_produto
ADD CONSTRAINT adicional_FK
FOREIGN KEY (ID_adicional) REFERENCES adicional(ID);
ALTER TABLE adicionar_produto
ADD CONSTRAINT produto_FK
FOREIGN KEY (ID_produto) REFERENCES produto(ID);

/*TABELA FAVORITOS*/
ALTER TABLE favoritos
ADD CONSTRAINT favoritos_usuario_FK
FOREIGN KEY (ID_usuario) REFERENCES usuario(ID);
ALTER TABLE favoritos
ADD CONSTRAINT favoritos_restaurante_FK
FOREIGN KEY (ID_restaurante) REFERENCES restaurante(ID);

/*TABELA PEDIDO-PRODUTO*/
ALTER TABLE pedido_produto
ADD CONSTRAINT pedido_produto_pedido_FK
FOREIGN KEY (pedido_ID) REFERENCES pedido(ID);
ALTER TABLE pedido_produto
ADD CONSTRAINT produto_pedido_produto_FK
FOREIGN KEY (ID_produto) REFERENCES produto(ID);

/*TABELA ADICIONAL-PRODUTO-PEDIDO*/
ALTER TABLE adicional_produto_pedido
ADD CONSTRAINT ad_pedido_produto_FK
FOREIGN KEY (pedido_produto_ID) REFERENCES pedido_produto(ID);
ALTER TABLE adicional_produto_pedido
ADD CONSTRAINT pedi_adicional_FK
FOREIGN KEY (adicional_ID) REFERENCES adicional(ID);

/*TABELA HISTORICO PEDIDO*/
ALTER TABLE historico_pedido
ADD CONSTRAINT htro_pedido_FK
FOREIGN KEY (pedido_ID) REFERENCES pedido(ID);
ALTER TABLE historico_pedido
ADD CONSTRAINT his_status_pedido_FK
FOREIGN KEY (status_pedido_ID) REFERENCES status_pedido(ID);

/*TABELA PAGAMENTO*/
ALTER TABLE pagamento
ADD CONSTRAINT paga_pedido_FK
FOREIGN KEY (pedido_ID) REFERENCES pedido(ID);
ALTER TABLE pagamento
ADD CONSTRAINT metado_pagamento_FK
FOREIGN KEY (metado_pagamento_ID) REFERENCES metado_pagamento(ID);
ALTER TABLE pagamento
ADD CONSTRAINT status_pagamento_FK
FOREIGN KEY (status_pagamento_ID) REFERENCES status_pagamento(ID);

/* TABELA FUNCIONAMENTO*/
ALTER TABLE funcionamento_restaurante
ADD CONSTRAINT funcionamento_restaurante_FK
FOREIGN KEY (ID_restaurante) REFERENCES restaurante(ID);

/* ESSA PARTE DO CÓDIGO E A PARTE DE INSERIR DADOS*/

/* INSERTS PARA A TABELA USUARIO*/
INSERT INTO usuario (date_Create, status, nome, email, senha, telefone, cpf) VALUES
(NOW(), 1, 'João', 'joao@example.com', 'senha123', '(11) 91234-5678', '12345678901'),
(NOW(), 1, 'Maria', 'maria@example.com', 'senha456', '(11) 98765-4321', '98765432109'),
(NOW(), 1, 'Pedro', 'pedro@example.com', 'senha789', '(11) 94567-1234', '45678901234');

/* INSERTS PARA A TABELA RESTAURANTE */
INSERT INTO restaurante (date_Create, status, nome, descricao, telefone, avaliacao, cnpj) VALUES
(NOW(), 1, 'Restaurante A', ' especializado em pratos italianos', '(11) 1234-5678', 4.5, '12345678901234'),
(NOW(), 1, 'Restaurante B', 'serve os melhores churrascos da região', '(11) 5678-1234', 4.7, '56789012345678'),
(NOW(), 1, 'Restaurante C', 'oferece uma variedade de pratos da culinária japonesa', '(11) 9012-3456', 4.3, '90123456789012');

/* INSERTS PARA A TABELA CATEGORIA_ESTABELECIMENTO */
INSERT INTO categoria_estabelecimeto (date_Create, status, nome, descricao) VALUES
(NOW(), 1, 'Italiano', 'Restaurantes que servem pratos italianos'),
(NOW(), 1, 'Churrascaria', 'Restaurantes especializados em churrascos'),
(NOW(), 1, 'Japonês', 'Restaurantes que oferecem pratos da culinária japonesa');

/* INSERTS PARA A TABELA ENDEREÇO*/
INSERT INTO endereco (date_Create, status, rua, bairro, cidade, cep, numero, complemento, padrao) VALUES
(NOW(), 1, 'Rua A', 'Bairro X', 'Cidade 1', '12345-678', '123', 'Próximo ao Parque', 1),
(NOW(), 1, 'Rua B', 'Bairro Y', 'Cidade 2', '98765-432', '456', 'Próximo à Praia', 0),
(NOW(), 1, 'Rua C', 'Bairro Z', 'Cidade 3', '54321-876', '789', 'Próximo à Estação', 0);

/* INSERTS PARA A TABELA PRODUTO */
INSERT INTO produto (date_Create, status, nome, preco, descricao) VALUES
(NOW(), 1, 'Pizza Margherita', 30, 'Pizza de mussarela, tomate e manjericão'),
(NOW(), 1, 'Churrasco Misto', 50, 'Churrasco com picanha, linguiça e frango'),
(NOW(), 1, 'Sushi Combo', 80, 'Combo de sushi com uma variedade de peixes e acompanhamentos');

/* INSERTS PARA A TABELA CATEGORIA_PRODUTO */
INSERT INTO categoria_produto (date_Create, status, nome, descricao) VALUES
(NOW(), 1, 'Pizza', 'Diversos sabores de pizza'),
(NOW(), 1, 'Churrasco', 'Carnes grelhadas e acompanhamentos'),
(NOW(), 1, 'Sushi', 'Pratos típicos da culinária japonesa');

/* INSERTS PARA A TABELA ADICIONAL */
INSERT INTO adicional (date_Create, status, nome, valor, descricao) VALUES
(NOW(), 1, 'Bacon', 5, 'Adicional de bacon para complementar seu prato'),
(NOW(), 1, 'Queijo Extra', 3, 'Adicional de queijo extra para seu sanduíche'),
(NOW(), 1, 'Molho Especial', 2, 'Molho especial para acompanhar suas batatas fritas');

/* INSERTS PARA A TABELA PEDIDO */
INSERT INTO pedido (date_Create, status, taxaEntrega, valorTotal, descricao, is_retirada) VALUES
(NOW(), 1, 5, 60, 'Pedido para entrega em casa', 0),
(NOW(), 1, 8, 100, 'Pedido para retirada no restaurante', 1),
(NOW(), 1, 10, 120, 'Pedido para entrega no trabalho', 0);

/* INSERTS PARA A TABELA STATUS_PEDIDO */
INSERT INTO status_pedido (date_Create, status, nome, descricao) VALUES
(NOW(), 1, 'Em Processamento', 'Pedido está em processo de preparo'),
(NOW(), 1, 'Pronto para Entrega', 'Pedido está pronto para ser entregue ao cliente'),
(NOW(), 1, 'Entregue', 'Pedido foi entregue ao cliente com sucesso');

/* INSERTS PARA A TABELA HISTORICO_PEDIDO */
INSERT INTO historico_pedido (date_Create, status,pedido_ID, status_pedido_ID) VALUES
(NOW(), 1,1,1),
(NOW(), 1,2,2),
(NOW(), 1,3,3);

/* INSERTS PARA A TABELA CUPOM */
INSERT INTO cupom (date_Create, status, codigo, valor, descriao, validade) VALUES
(NOW(), 1, 'DESC10', 10, 'Desconto de 10% em seu próximo pedido', 30),
(NOW(), 1, 'FRETEGRATIS', 0, 'Frete grátis em seu próximo pedido', 15),
(NOW(), 1, 'DESC20', 20, 'Desconto de 20% em seu próximo pedido', 45);

/* INSERTS PARA A TABELA ADICIONAL_PRODUTO_PEDIDO */
INSERT INTO adicional_produto_pedido (date_Create, status, quantidade, adicional_ID, pedido_produto_ID) 
VALUES 
(NOW(), 1, 2, 1, NULL), 
(NOW(), 1, 3, 2,NULL ), 
(NOW(), 1, 1, 3,NULL);

/* INSERTS PARA A TABELA AVALIACAO */
INSERT INTO avaliacao (date_Create, status, nota_restaurante, nota_pedido, descricao) VALUES
(NOW(), 1, 4, 5, 'Excelente atendimento e comida deliciosa'),
(NOW(), 1, 3, 4, 'Bom serviço, mas a entrega demorou um pouco'),
(NOW(), 1, 5, 5, 'Serviço rápido e comida de alta qualidade');

/* INSERTS PARA A TABELA PAGAMENTO */
INSERT INTO pagamento (date_Create, status, valor, data_hora) VALUES
(NOW(), 1, 50, '2024-05-14 12:45:00'),
(NOW(), 1, 80, '2024-05-14 16:57:00'),
(NOW(), 1, 100, '2024-05-14 09:00:00');

/* INSERTS PARA A TABELA METADO_PAGAMENTO */
INSERT INTO metado_pagamento (date_Create, status, nome, descricao) VALUES
(NOW(), 1, 'Cartão de Crédito', 'Pagamento via cartão de crédito'),
(NOW(), 1, 'Cartão de Débito', 'Pagamento via cartão de débito'),
(NOW(), 1, 'Pix', 'Pagamento via Pix');

/* INSERTS PARA A TABELA STATUS_PAGAMENTO */
INSERT INTO status_pagamento (date_Create, status, nome, descricao) VALUES
(NOW(), 1, 'Pendente', 'Pagamento ainda não realizado'),
(NOW(), 1, 'Concluído', 'Pagamento concluído com sucesso'),
(NOW(), 1, 'Reembolsado', 'Pagamento foi reembolsado ao cliente');

/* INSERTS PARA A TABELA FAVORITOS */
INSERT INTO favoritos (ID_usuario, ID_restaurante) VALUES
(1, 1),
(2, 2),
(3, 3);

/* INSERTS PARA A TABELA PEDIDO_PRODUTO */
INSERT INTO pedido_produto (date_Create, status, pedido_ID, ID_produto) VALUES
(NOW(), 1, 1, 1),
(NOW(), 1, 2, 2),
(NOW(), 1, 3, 3);

/* INSERTS PARA A TABELA FUNCIONAMENTO_RESTAURANTE */
INSERT INTO funcionamento_restaurante (date_Create, status, dia, hora_abrir, hora_fechar) VALUES
(NOW(), 1, 1, 10, 22),
(NOW(), 1, 2, 11, 23),
(NOW(), 1, 3, 09, 21);

/* INSERTS PARA A TABELA ADICIONAR_PRODUTO */
INSERT INTO adicionar_produto (ID_adicional, ID_produto) VALUES
( 1, 2),
( 1, 3),
( 1, 1);