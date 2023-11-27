CREATE DATABASE AluguelVeiculos;


-- A TABELA FOI DESMEMBRADA EM TABELAS DISTINTAS E INTERLIGADAS 

CREATE TABLE IF NOT EXISTS Locacao (
    codlocacao INT PRIMARY KEY AUTO_INCREMENT,
    Veiculo INT,
    Cor VARCHAR(30) NOT NULL,
    Placa VARCHAR(15) NOT NULL UNIQUE,
    Diaria DECIMAL(5,2) NOT NULL,
    Cliente int not null,
    Dias INT NOT NULL,
    FOREIGN KEY (Veiculo) references Veiculo(id_veiculo),
    FOREIGN KEY (Cliente) references Cliente(id_cliente)
);

CREATE TABLE IF NOT EXISTS Cliente (
	id_locacao int,
    id_cliente int not null primary key, 
    ClienteNome VARCHAR(100) NOT NULL, 
    ClienteCPF VARCHAR(18) NOT NULL,
    ClienteNascimento DATE NOT NULL,
    FOREIGN KEY (id_locacao) references Locacao(codlocacao)
);

CREATE TABLE IF NOT EXISTS Veiculo(
	id_veiculo int primary key not null,
    id_locacao int,
    Cor VARCHAR(30) NOT NULL,
    Placa VARCHAR(15) NOT NULL UNIQUE,
    Diaria DECIMAL(5,2) NOT NULL,
    FOREIGN KEY (id_locacao) references Locacao(codlocacao)
);


-- A VIEW PARA EXIBICAO DA LOCACAO 

CREATE VIEW ExibirLocacao AS
SELECT *
FROM Locacao
JOIN Cliente ON Locacao.Cliente = Cliente.id_cliente
JOIN Veiculo ON Locacao.Veiculo = Veiculo.id_veiculo;

