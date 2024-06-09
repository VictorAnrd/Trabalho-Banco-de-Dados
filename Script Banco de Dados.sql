CREATE DATABASE trabalhoBD;
use trabalhoBD;

CREATE TABLE Usuario (
    idUsuario BIGINT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    endereco VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL
);

CREATE TABLE Locador (
    idLocador BIGINT PRIMARY KEY,
    idUsuario BIGINT,
    FOREIGN KEY (idUsuario) REFERENCES Usuario(idUsuario)
);

CREATE TABLE Locatario (
    idLocatario BIGINT PRIMARY KEY,
    idUsuario BIGINT,
    FOREIGN KEY (idUsuario) REFERENCES Usuario(idUsuario)
);

CREATE TABLE Imoveis (
    idImoveis BIGINT PRIMARY KEY,
    quarto INTEGER NOT NULL CHECK (quarto > 0),
    banheiro INTEGER NOT NULL CHECK (banheiro > 0),
    cozinha INTEGER NOT NULL CHECK (cozinha > 0),
    endereco VARCHAR(255) NOT NULL
);

CREATE TABLE Casa (
    idCasa BIGINT PRIMARY KEY,
    idImoveis BIGINT,
    FOREIGN KEY (idImoveis) REFERENCES Imoveis(idImoveis)
);

CREATE TABLE Apartamento (
    idApartamento BIGINT PRIMARY KEY,
    idImoveis BIGINT,
    FOREIGN KEY (idImoveis) REFERENCES Imoveis(idImoveis)
);

CREATE TABLE Avaliacao (
    idAvaliacao BIGINT PRIMARY KEY,
    data DATE NOT NULL,
    classificacao INTEGER NOT NULL CHECK (classificacao BETWEEN 1 AND 5),
    comentario VARCHAR(255),
    idUsuario BIGINT,
    idImoveis BIGINT,
    FOREIGN KEY (idUsuario) REFERENCES Usuario(idUsuario),
    FOREIGN KEY (idImoveis) REFERENCES Imoveis(idImoveis)
);

CREATE TABLE Pagamento (
    idPagamento BIGINT PRIMARY KEY,
    valor DOUBLE NOT NULL CHECK (valor > 0),
    data DATE NOT NULL,
    metodo VARCHAR(50) NOT NULL,
    status VARCHAR(50) NOT NULL,
    idUsuario BIGINT,
    idImoveis BIGINT,
    FOREIGN KEY (idUsuario) REFERENCES Usuario(idUsuario),
    FOREIGN KEY (idImoveis) REFERENCES Imoveis(idImoveis)
);

INSERT INTO Usuario (idUsuario, nome, endereco, email, senha) VALUES
(1, 'João Silva', 'Rua rio de janeiro, 431', 'joao@gamil.com', 'joao123'),
(2, 'Maria Oliveira', 'Rua sao paulo, 314', 'maria@gmail.com', 'maria123');

INSERT INTO Locador (idLocador, idUsuario) VALUES
(1, 1);

INSERT INTO Locatario (idLocatario, idUsuario) VALUES
(1, 2);

INSERT INTO Imoveis (idImoveis, quarto, banheiro, cozinha, endereco) VALUES
(1, 3, 2, 1, 'Rua amazonas, 789'),
(2, 2, 1, 1, 'Rua parana, 101');

INSERT INTO Casa (idCasa, idImoveis) VALUES
(1, 1);

INSERT INTO Apartamento (idApartamento, idImoveis) VALUES
(1, 2);

INSERT INTO Avaliacao (idAvaliacao, data, classificacao, comentario, idUsuario, idImoveis) VALUES
(1, '2024-06-01', 5, 'Excelente casa!', 2, 1);

INSERT INTO Pagamento (idPagamento, valor, data, metodo, status, idUsuario, idImoveis) VALUES
(1, 500.00, '2024-06-01', 'Cartão de Crédito', 'Pago', 2, 1);