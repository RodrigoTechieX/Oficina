CREATE DATABASE IF NOT EXISTS OFICINA;

USE OFICINA;

CREATE TABLE FORNECEDOR
(
    IDFORNECEDOR INT PRIMARY KEY AUTO_INCREMENT,
    RAZAOSOCIAL  VARCHAR(50) UNIQUE NOT NULL,
    CEP          CHAR(8)            NOT NULL,
    EMAIL        VARCHAR(50) UNIQUE NOT NULL,
    TELEFONE     CHAR(9) UNIQUE     NOT NULL

);

CREATE TABLE FUNCIONARIO
(
    IDFUNCIONARIO INT PRIMARY KEY AUTO_INCREMENT,
    NOME          VARCHAR(50)        NOT NULL,
    CPF           CHAR(11) UNIQUE    NOT NULL,
    EMAIL         VARCHAR(50) UNIQUE NOT NULL,
    TELEFONE      CHAR(11) NOT NULL,
    LOGIN         VARCHAR(50) UNIQUE NOT NULL,
    SENHA         VARCHAR(50) NOT NULL

);

CREATE TABLE PRODUTO
(
    IDPRODUTO    INT PRIMARY KEY AUTO_INCREMENT,
    NOME_PRODUTO VARCHAR(50) NOT NULL,
    PRECO DOUBLE NOT NULL,
    QTD          INT         NOT NULL
);


CREATE TABLE ENTRADA
(
    IDENTRADA     INT PRIMARY KEY AUTO_INCREMENT,
    IDFORNECEDOR  INT,
    IDFUNCIONARIO INT,
    IDPRODUTO     INT,
    DATAENTRADA   DATE NOT NULL,
    VALORTOTAL DOUBLE NOT NULL,
    PRECOENTRADA DOUBLE NOT NULL,
    QTDENTRADA INT,

    FOREIGN KEY (IDFORNECEDOR)
        REFERENCES FORNECEDOR (IDFORNECEDOR),
    FOREIGN KEY (IDFUNCIONARIO)
        REFERENCES FUNCIONARIO (IDFUNCIONARIO),
    FOREIGN KEY (IDPRODUTO)
        REFERENCES PRODUTO (IDPRODUTO)
);

CREATE TABLE SAIDA
(
    IDSAIDA       INT PRIMARY KEY AUTO_INCREMENT,
    IDPRODUTO     INT,
    IDFUNCIONARIO INT,
    VALOR DOUBLE,
    QTDSAIDA      INT,
    DATASAIDA     DATE NOT NULL,

    FOREIGN KEY (IDPRODUTO)
        REFERENCES PRODUTO (IDPRODUTO),
    FOREIGN KEY (IDFUNCIONARIO)
        REFERENCES FUNCIONARIO (IDFUNCIONARIO)
);


INSERT INTO FORNECEDOR (RAZAOSOCIAL, CEP, EMAIL, TELEFONE) VALUES
('Fornecedor A', '12345678', 'fornecedorA@example.com', '123456789'),
('Fornecedor B', '87654321', 'fornecedorB@example.com', '987654321'),
('Fornecedor C', '12348765', 'fornecedorC@example.com', '123498765'),
('Fornecedor D', '56781234', 'fornecedorD@example.com', '567812345'),
('Fornecedor E', '43218765', 'fornecedorE@example.com', '432198765');

-- Inserindo registros na tabela FUNCIONARIO
INSERT INTO FUNCIONARIO (NOME, CPF, EMAIL, TELEFONE, LOGIN, SENHA) VALUES
('Funcionario A', '11111111111', 'funcA@example.com', '1111111111', 'loginA', 'senhaA'),
('Funcionario B', '22222222222', 'funcB@example.com', '2222222222', 'loginB', 'senhaB'),
('Funcionario C', '33333333333', 'funcC@example.com', '3333333333', 'loginC', 'senhaC'),
('Funcionario D', '44444444444', 'funcD@example.com', '4444444444', 'loginD', 'senhaD'),
('Funcionario E', '55555555555', 'funcE@example.com', '5555555555', 'loginE', 'senhaE');

-- Inserindo registros na tabela PRODUTO
INSERT INTO PRODUTO (NOME_PRODUTO, PRECO, QTD) VALUES
('Produto A', 0, 0),
('Produto B', 0, 0),
('Produto C', 0, 0),
('Produto D', 0, 0),
('Produto E', 0, 0);




