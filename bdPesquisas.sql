----- Criação do banco de dados -----

CREATE DATABASE bdPesquisas
USE bdPesquisas

----- Criação das tabelas -----

CREATE TABLE tbl_veiculos (
	marca CHAR(04) NOT NULL,
	modelo VARCHAR(05) NOT NULL,
	ano CHAR(04) NOT NULL,
	cor VARCHAR(06) NOT NULL,
	valor MONEY NOT NULL,
	portas INT NOT NULL,
	combustivel VARCHAR(04) NOT NULL
);

CREATE TABLE tbl_pesquisa (
	id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	nome VARCHAR(14) NOT NULL,
	profissao VARCHAR(11) NOT NULL,
	nascimento VARCHAR(10) NOT NULL,
	sexo CHAR(01) NOT NULL,
	peso FLOAT NOT NULL,
	altura FLOAT NOT NULL,
	país VARCHAR(12) NOT NULL
);

CREATE TABLE tbl_vendas (
	Registro INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	Vendedor VARCHAR(07) NOT NULL,
	DataVenda DATE NOT NULL,
	Produto VARCHAR(09) NOT NULL,
	PrecoUnitario MONEY NOT NULL,
	Quantidade INT NOT NULL,
	VendaTotal MONEY NOT NULL
);

----- Inserção de dados -----

INSERT INTO tbl_veiculos
VALUES ('Fiat', 'Uno', '2010', 'branco', 30600, 2, 'flex'), 
       ('Fiat', 'Palio', '2010', 'prata', 35500, 2, 'flex'),
       ('Fiat', 'Uno', '2008', 'prata', 29600, 4, 'GNV'),
       ('Fiat', 'Stilo', '2010', 'verde', 42600, 4, 'flex'),
       ('Fiat', 'Uno', '2008', 'preto', 44900, 4, 'flex'),
       ('Fiat', 'Punto', '2009', 'branco', 25500, 4, 'flex'),
       ('Fiat', 'Uno', '2008', 'branco', 23000, 2, 'flex'),
       ('Fiat', 'Palio', '2007', 'prata', 26000, 2, 'flex')

INSERT INTO tbl_pesquisa
VALUES ('Caio', 'Professor', '19840102', 'M', 78.50, 1.83, 'BRASIL'),
       ('Felipe', 'Empresário', '19840102', 'M', 78.50, 1.83, 'Afeganistão'),
       ('Alfredo', 'Juiz', '19920304', 'M', 85.3, 1.86, 'BRASIL'),
       ('Alessandra', 'Diretora', '19850503', 'F', 73.40, 1.76, 'Brasil'),
       ('Márcio', 'Professor', '19840102', 'M', 78.50, 1.83, 'BRASIL'),
       ('Pablo', 'Juiz', '19920304', 'M', 82.50, 1.85, 'Angola'),
       ('Andiara', 'Professora', '19850503', 'F', 75.30, 1.76, 'BRASIL'),
       ('Gustavo', 'Marceneiro', '19900604', 'M', 80.30, 1.90, 'Inglaterra'),
       ('José Fernando', 'Professor', '19840102', 'M', 78.50, 1.83, 'BRASIL'),
       ('Augusto', 'Contador', '19920304', 'M', 82.50, 1.85, 'Canadá'),
       ('Luciana', 'Advogado', '19850503', 'F', 75.30, 1.76, 'Brasil'),
       ('Celso', 'Professor', '19900604', 'M', 80.30, 1.90, 'France'),
       ('Paulo', 'Padeiro', '19450304', 'M', 99.90, 1.87, 'Suíça')

INSERT INTO tbl_vendas
VALUES ('Luciano', '20150105', 'Produto A', 50, 1, 50),
       ('Rafael', '20150105', 'Produto A', 50, 2, 100),
       ('Renata', '20150105', 'Produto A', 50, 3, 150),
       ('Luciano', '20150105', 'Produto B', 30, 2, 60),
       ('Rafael', '20150105', 'Produto B', 30, 5, 150),
       ('Renata', '20150105', 'Produto B', 30, 4, 120),
       ('Luciano', '20150106', 'Produto A', 50, 6, 300),
       ('Rafael', '20150106', 'Produto A', 50, 2, 100),
       ('Renata', '20150106', 'Produto A', 50, 9, 450),
       ('Luciano', '20150106', 'Produto B', 30, 6, 180),
       ('Rafael', '20150106', 'Produto B', 30, 8, 240),
       ('Renata', '20150106', 'Produto B', 30, 4, 120)

----- Realização de consultas -----

-- SLIDE 12

SELECT (valor*1.1) AS valor
FROM tbl_veiculos

SELECT COUNT(modelo)
FROM tbl_veiculos
WHERE modelo = 'Uno'

SELECT COUNT(marca)
FROM tbl_veiculos
WHERE portas = 4 AND modelo = 'Palio'

SELECT DATEDIFF (DAY, '15/01/2010','05/10/2020') AS 'Diferença em dias', 
DATEDIFF (MONTH, '15/01/2010','05/10/2020') AS 'Diferença em meses',
DATEDIFF (YEAR, '15/01/2010','05/10/2020') AS 'Diferença em anos'

-- SLIDE 13

SELECT AVG(peso) AS 'Média do peso'
FROM tbl_pesquisa

SELECT AVG(altura) AS 'Média da altura'
FROM tbl_pesquisa

SELECT COUNT(id) AS 'Brasileiros'
FROM tbl_pesquisa
WHERE país = 'Brasil'

SELECT COUNT(id) AS 'Brasileiros e Professores'
FROM tbl_pesquisa
WHERE país = 'Brasil' AND profissao = 'Professor' OR profissao = 'Professora'

SELECT nome AS Nome, 
SUBSTRING(nascimento,7,8) + '/' + SUBSTRING(nascimento,5,6) + '/' + SUBSTRING(nascimento,1,4) AS 'Data de nascimento',
DATEDIFF (YEAR, nascimento, GETDATE()) AS Idade,
profissao AS Profissão
FROM tbl_pesquisa

-- SLIDE 14

SELECT SUM(Quantidade) AS 'Produtos vendidos dia 05/01/2015'
FROM tbl_vendas
WHERE DataVenda = '20150105'

SELECT SUM(Quantidade) AS 'Produtos vendidos dia 05/01/2015'
FROM tbl_vendas
WHERE DataVenda = '20150106' AND Produto = 'Produto B'

SELECT AVG(VendaTotal) AS 'Média dos valores vendidos'
FROM tbl_vendas

SELECT DATEDIFF (DAY, '05/01/2015', GETDATE()) AS 'Diferença em dias',
DATEDIFF (MONTH, '05/01/2015', GETDATE()) AS 'Diferença em meses',
DATEDIFF (YEAR, '05/01/2015', GETDATE()) AS 'Diferença em anos'