

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

/*TABELA PRODUTO*/
ALTER TABLE produto
ADD CONSTRAINT categoria_produto_FK
FOREIGN KEY (categoria_produto_ID) REFERENCES categoria_produto(ID);
ALTER TABLE produto
ADD CONSTRAINT restaurante_FK
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

/*TABELA ADICIONAR PRODUTO*/
ALTER TABLE adicionar_produto
ADD CONSTRAINT adicional_FK
FOREIGN KEY (adicional_ID) REFERENCES adicional(ID);
ALTER TABLE adicionar_produto
ADD CONSTRAINT produto_FK
FOREIGN KEY (ID_produto) REFERENCES produto(ID);

/*TABELA FAVORITOS*/
ALTER TABLE favoritos
ADD CONSTRAINT usuario_FK
FOREIGN KEY (ID_usuario) REFERENCES usuario(ID);
ALTER TABLE favoritos
ADD CONSTRAINT restaurante_FK
FOREIGN KEY (ID_restaurante) REFERENCES restaurante(ID);

/*TABELA PEDIDO-PRODUTO*/
ALTER TABLE pedido_produto
ADD CONSTRAINT pedido_FK
FOREIGN KEY (pedido_ID) REFERENCES pedido(ID);
ALTER TABLE pedido_produto
ADD CONSTRAINT produto_FK
FOREIGN KEY (ID_produto) REFERENCES produto(ID);

/*TABELA ADICIONAL-PRODUTO-PEDIDO*/
ALTER TABLE adicional_produto_pedido
ADD CONSTRAINT pedido_produto_FK
FOREIGN KEY (pedido_produto_ID) REFERENCES pedido_produto(ID);
ALTER TABLE adicional_produto_pedido
ADD CONSTRAINT adicional_FK
FOREIGN KEY (adicional_ID) REFERENCES adicional(ID);

/*TABELA HISTORICO PEDIDO*/
ALTER TABLE historico_pedido
ADD CONSTRAINT pedido_FK
FOREIGN KEY (pedido_ID) REFERENCES pedido(ID);
ALTER TABLE historico_pedido
ADD CONSTRAINT status_pedido_FK
FOREIGN KEY (status_pedido_ID) REFERENCES status_pedido(ID);

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

/* TABELA FUNCIONAMENTO*/
ALTER TABLE funcionamento_restaurante
ADD CONSTRAINT restaurante_FK
FOREIGN KEY (ID_restaurante) REFERENCES restaurante(ID);

/* ESSA PARTE DO CÓDIGO E A PARTE DE INSERIR DADOS*/

/* USUSARIO*/
INSERT INTO usuario(dateCreate,dateTime,status,nome,email,,senha,telefone,cpf) VALUES 
(now(),19:22,1,'rafael','rafael922@gmail.com','rafael6226','(83)98234-4343','29292202192'),
(now(),21:33,1,'thalia','thalia522@gmail.com','ailaht14321','(87)98123-3832','27382382384'),
(now(),08:29,1,'camila','cami812@gmail.com','camilaviter23','(11)99273-3731','82819100022');
/*RESTAURANTE*/
INSERT INTO restaurante(dateCreate,dateTime,status,nome,descricao,telefone,avaliacao,cnpj,categoria_estabelecimeto_FK) VALUES
(now(),12:11,1,'tapioca da ana','tapioca com os melhores produtos do mercado','91812-1211',5,'82912812973'1),
(now(),22:11,1,'churrasco grego','o melhor dos churrascos gregos','23322-3232',3,'43433443433',2),
(now(),09:42,0,'la casa de massa','as melhores massa so encontra aqui','32243-2323',5,'211221221212',3);
/*CATEGORIA ESTABELECIMENTO*/
INSERT INTO categoria_estabelecimeto(dateCreate,dateTime,status,nome,descricao) VALUES
(now(),12:11,1,'fast food','pronto rapido'),
(now(),22:11,1,'fast food','pronto rapido'),
(now(),09:42,0,'italiano','italianos');
/*ENDEREÇO*/
INSERT INTO endereco(dateCreate, dateTime, status, rua, bairro, cidade, cep, numero, complemento, padrao,usuario_FK,restaurante_FK) VALUES
(now(),12:11,1,'Rua Alfredo neves', 'Bairro Avenida ribero', 'Cidade aracaju', '12345-111', '101', 'a frete do estadio nilto santos', 0,1,1),
(now(),22:11,1, 'Rua luiz dultra', 'Bairro Barcorna', 'Cidade Belo horizinte', '12345-222', '202', 'ao lado do mercado ABT ', 0,2,2),
(now(),09:42,1,'Rua Carvalho', 'Bairro Centro', 'Cidade Caruaru', '12345-333', '303', 'perto do shopping ', 0,3,3);
/*PRODUTO*/
INSERT INTO produto (dateCreate, dateTime, status, nome, preco, descricao,categoria_produto_FK,restaurante_FK) VALUES
(now(),12:11,1, 'recheio', 100, 'recheio de nutella',1,1),
(now(),22:11,1,'carne', 300, 'picanha',2,2 ),
(now(),09:42,1,'macarrão', 50, 'macarrão pra lasanha'3,3);
/*CATEGORIA PRODUTO*/
INSERT INTO categoria_produto (dateCreate, dateTime, status, nome, descricao) VALUES
(now(),12:11,1, 'recheios', 'recheios pra comidas '),
(now(),22:11,1,'carnes','carnes para churrascos'),
(now(),09:42,1,'massas','todos os tipos de massa');
/*ADICIONAL*/
INSERT INTO adicional(dateCreate, dateTime, status, nome, valor, descricao) VALUES
(now(),12:11,1, 'morango', 50, 'recheio de morango'),
(now(),22:11,1,'picanha',120,'picanha mal passada'),
(now(),09:42,1,'molho'21,'molho de tomate');
/*PEDIDO*/
INSERT INTO pedido(dateCreate, dateTime, status, taxaEntrega, valorTotal, descricao, is_retirada,endereco_FK,usuario_FK,restaurante_FK,cupom_FK,status_pedido_FK) VALUES
(now(),12:11,1, 10, 150, 'traga o mais rapido possivel', 0,1,1,1,1,1 ),
(now(),22:11,1, 15, 200, 'não demore', 1,2,2,2,2,2),
(now(),09:42,1, 20, 180, 'não quero a massa fria', 0,3,3,3,3,3);
/*STATUS PEDIDO*/
INSERT INTO status_pedido(dateCreate, dateTime, status, nome, descricao)VALUES
(now(),12:11,1, 'Em andamento', 'Pedido em andamento, aguardando preparo'),
(now(),22:11,1,'Pronto para entrega', 'Pedido pronto para entrega ao cliente'),
(now(),09:42,1,'Entregue', 'Pedido entregue com sucesso ao cliente');
/*HISTORICO PEDIDO*/
INSERT INTO historico_pedido(dateCreate, dateTime, status,pedido_FK,status_pedido_FK) VALUES
(now(),12:11,1,1,1),
(now(),22:11,1,2,2),
(now(),09:42,1,3,3);
/*CUPOM*/
INSERT INTO cupom(dateCreate, dateTime, status, codigo, valor, descricao, validade) VALUES
(now(),12:11,1,'CUPOM123', 10, 'Desconto de 10%',7),
(now(),22:11,1,'CUPOM456', 20, 'Desconto de 20%', 14),
(now(),09:42,1,'CUPOM789', 15, 'Desconto de 15%',30);
/*ADICIONAL PRODUTO PEDIDO*/
INSERT INTO adicional_produto_pedido(dateCreate, dateTime, status, quantidade,pedido_produto_FK,adicional_FK)VALUES
(now(),12:11,1,2,1,1),
(now(),22:11,1,5,2,2),
(now(),09:42,1,12,3,3);
/*AVALIAÇÃO*/
INSERT INTO avaliacao(dateCreate, dateTime, status, nota_restaurante, nota_pedido, descricao,pedido_FK) VALUES 
(now(),12:11,1, 4, 5, 'Excelente serviço e comida deliciosa',1),
(now(),22:11,1,3, 4, 'Bom atendimento, mas a entrega demorou um pouco',2),
(now(),09:42,1, 5, 5, 'Maravilhoso, entrega rápida e comida fresca',3);
/*PAGAMENTO*/
INSERT INTO pagamento(dateCreate, dateTime, status, valor, data_hora,pedido_FK,metado_pagamento_FK,status_pagamento_FK) VALUES
(now(),12:11,1,500,12:45,1,1,1),
(now(),22:11,1,750,16:57,2,2,2),
(now(),09:42,1,340,09:00,3,3,3);
/*METADO PAGAMENTO*/
INSERT INTO metado_pagamento(dateCreate, dateTime, status, nome, descricao) VALUES
(now(),12:11,1,'Cartão de Crédito', 'Pagamento via cartão de crédito'),
(now(),22:11,1,'Cartão de Débito', 'Pagamento via cartão de débito'),
(now(),09:42,1,'Pix','Pagamento via Pix');
/* STATUS PAGAMENTO*/
INSERT INTO status_pagamento (dateCreate, dateTime, status, nome, descricao) VALUES
(now(),12:11,1,'Pendente', 'Pagamento ainda não realizado'),
(now(),22:11,1,'Concluído', 'Pagamento concluído com sucesso'),
(now(),09:42,1,'Reembolsado', 'Pagamento foi reembolsado ao cliente');
/*FAVORITOS*/
INSERT INTO favoritos(usuario_FK,restaurante_FK) VALUES
(1,1),
(2,2),
(3,3);
 /*PEDIDO PRODUTO*/
 INSERT INTO pedido_produto (dateCreate, dateTime, status,pedido_FK,produto_FK) VALUES
(now(),12:11,1,1,1),
(now(),22:11,1,2,2),
(now(),09:42,1,3,3);
/*FUNCIONAMENTO RESTAURANTE*/
INSERT INTO funcionamento_restaurante(dateCreate, dateTime, status, dia, hora_abrir, hora_fechar,restaurante_FK) VALUES
(now(),12:11,1,5,08:00,22:00,1),
(now(),22:11,1,7,10:00,20:00,2),
(now(),09:42,1,4,07:00,18:00,3);
/*ADICIONAR PRODUTO*/
INSERT INTO adicionar_produto(produto_FK,adicional_FK) VALUES
(1,1),
(2,2),
(3,3);

