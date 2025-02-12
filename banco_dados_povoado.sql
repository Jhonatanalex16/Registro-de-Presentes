CREATE DATABASE IF NOT EXISTS sistema;
USE sistema;

CREATE TABLE Anfitriao (
    IdAnfitriao INT PRIMARY KEY,
    Nome VARCHAR(100),
    Endereco VARCHAR(255),
    telefone VARCHAR(20)
);

CREATE TABLE Administrador (
    IdAdministrador INT PRIMARY KEY,
    Nome VARCHAR(100),
    telefone VARCHAR(20)
);

CREATE TABLE Convidado (
    IdConvidado INT PRIMARY KEY,
    Nome VARCHAR(100),
    CPF VARCHAR(11) UNIQUE,
    telefone VARCHAR(20)
);

CREATE TABLE Produto (
    IdProduto INT PRIMARY KEY,
    Nome VARCHAR(100),
    Grupo VARCHAR(50)
);

CREATE TABLE Endereco (
    IdEndereco INT PRIMARY KEY,
    Rua VARCHAR(255),
    Bairro VARCHAR(100),
    numero VARCHAR(10),
    Cidade VARCHAR(100),
    CEP VARCHAR(10)
);

CREATE TABLE Telefone (
    IdTelefone INT PRIMARY KEY,
    Operadora VARCHAR(50),
    numero VARCHAR(10),
    IdAnfitriao INT,
    IdAdministrador INT,
    IdConvidado INT,
    FOREIGN KEY (IdAnfitriao) REFERENCES Anfitriao(IdAnfitriao),
    FOREIGN KEY (IdAdministrador) REFERENCES Administrador(IdAdministrador),
    FOREIGN KEY (IdConvidado) REFERENCES Convidado(IdConvidado)
);

CREATE TABLE Pagamento (
    IdPagamento INT PRIMARY KEY,
    Nome VARCHAR(100),
    FormaPagamento VARCHAR(50),
    IdConvidado VARCHAR(50),
    FOREIGN KEY (IdConvidado) REFERENCES Convidado(IdConvidado)
);

CREATE TABLE Anfitriao_Produto (
    IdAnfitriao INT,
    IdProduto INT,
    PRIMARY KEY (IdAnfitriao, IdProduto),
    FOREIGN KEY (IdAnfitriao) REFERENCES Anfitriao(IdAnfitriao),
    FOREIGN KEY (IdProduto) REFERENCES Produto(IdProduto)
);


-- Inserindo dados na tabela Anfitriao
INSERT INTO Anfitriao (IdAnfitriao, Nome, Endereco, telefone) VALUES
(1, 'Carlos Silva', 'Rua A, 123', '11987654321'),
(2, 'Mariana Souza', 'Rua B, 456', '11991234567');

-- Inserindo dados na tabela Administrador
INSERT INTO Administrador (IdAdministrador, Nome, telefone) VALUES
(1, 'João Pereira', '11976543210'),
(2, 'Fernanda Lima', '11999887766');

-- Inserindo dados na tabela Convidado
INSERT INTO Convidado (IdConvidado, Nome, CPF, telefone) VALUES
(1, 'Ana Oliveira', '12345678901', '11988776655'),
(2, 'Ricardo Santos', '98765432100', '11977665544');

-- Inserindo dados na tabela Produto
INSERT INTO Produto (IdProduto, Nome, Grupo) VALUES
(1, 'Teclado Gamer', 'Periféricos'),
(2, 'Mouse Sem Fio', 'Periféricos'),
(3, 'Monitor 24"', 'Monitores');

-- Inserindo dados na tabela Endereco
INSERT INTO Endereco (IdEndereco, Rua, Bairro, numero, Cidade, CEP) VALUES
(1 , 'Rua das Flores', 'Centro', '100', 'São Paulo', '12345678'),
(2 , 'Avenida Paulista', 'Bela Vista', '2000', 'São Paulo', '87654321');

-- Inserindo dados na tabela Telefone
INSERT INTO Telefone (IdTelefone, Operadora, numero, IdAnfitriao, IdAdministrador, IdConvidado) VALUES
(1, 'Vivo', '11987654321', 1, NULL, NULL),
(2, 'Claro', '11991234567', 2, NULL, NULL),
(3, 'Tim', '11976543210', NULL, 1, NULL),
(4, 'Oi', '11999887766', NULL, 2, NULL),
(5, 'Vivo', '11988776655', NULL, NULL, 1),
(6, 'Claro', '11977665544', NULL, NULL, 2);
