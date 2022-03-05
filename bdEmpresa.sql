----- Criação do banco de dados -----

CREATE DATABASE bdEmpresa
USE bdEmpresa

----- Criação das tabelas -----

CREATE TABLE tbl_funcionários (
	idFunc INT PRIMARY KEY IDENTITY(1,1),
	nomeFunc VARCHAR(100) NOT NULL,
	cargoFunc VARCHAR(100) NOT NULL,
	nascFunc VARCHAR(10) NOT NULL,
	presencaFunc VARCHAR(10) NOT NULL,
	salarioBaseFunc MONEY NOT NULL,
	avaliacaoFunc FLOAT NOT NULL
);

CREATE TABLE tbl_departamento (
	nomeDepto VARCHAR(100) NOT NULL,
	numeroDepto INT PRIMARY KEY,
	rgGerenteDepto INT NOT NULL
);

CREATE TABLE tbl_empregado (
	idEmpre INT PRIMARY KEY IDENTITY(1,1),
	nomeEmpre VARCHAR(100) NOT NULL,
	rgEmpre CHAR(09) NOT NULL,
	cicEmpre CHAR(11) NOT NULL,
	deptoEmpre INT NOT NULL,
	rgSupervisorEmpre INT,
	salarioEmpre VARCHAR(50) NOT NULL
);

----- Inserção de dados -----

INSERT INTO tbl_funcionários
VALUES ('João Maria de Jesus', 'Administrativo', '07/23/78', '80.2', 10600, 8.7),
       ('Felipe dos Santos', 'Técnico', '11/02/88', '90', 18200, 5.6),
	   ('Maria José Silva', 'Técnico', '12/23/90', '87.3', 15000, 4.5),
	   ('José Silva', 'Administrativo', '12/23/78', '60', 16200, 9.3),
	   ('Mário Antunes', 'RH', '02/11/77', '54.2', 8000, 7.2),
	   ('Paulo Roberto Silva', 'RH', '10/13/76', '87.2333', 8900, 9.9),
	   ('Teresa Jardim', 'RH', '01/13/80', '100', 4000, 7.7),
	   ('Roberto Carlos Alves', 'RH', '12/10/83', '23.64', 4000, 7.7),
	   ('Paulo Jardim', 'RH', '06/28/45', '34.89', 30500, 10),
	   ('Maria Eduarda Carvalho da Rosa', 'Administrativo', '08/30/70', '90.78', 9000, 6.6),
	   ('Pedro Henrique Teixeira', 'Técnico', '12/23/78', '100', 7400, 7.2)

INSERT INTO tbl_departamento
VALUES ('Contabilidade', 1, 10101010),
       ('Engenharia Civil', 2, 30303030),
	   ('Engenharia Mecânica', 3, 20202020)

INSERT INTO tbl_empregado
VALUES ('João Luis', '101010101', '11111111111', 1, NULL, '3.000,00'),
       ('Fernando', '202020202', '22222222222', 2, 10101010, '2.500,00'),
       ('Ricardo', '303030303', '33333333333', 2, 10101010, '2.300,00'),
       ('Jorge', '404040404', '44444444444', 2, 20202020, '4.200,00'),
       ('Renato', '505050505', '55555555555', 3, 20202020, '1.300,00')

----- Realização de consultas -----

SELECT nomeFunc AS 'Nome', SUBSTRING(presencaFunc,1,10) + '%' AS 'Taxa de Presença', 'R$ ' + CAST(salarioBaseFunc AS VARCHAR) AS 'Salário Base' 
FROM tbl_funcionários
ORDER BY presencaFunc DESC

SELECT nomeEmpre AS Nome, SUBSTRING(rgEmpre,1,2) + '.' + SUBSTRING(rgEmpre,3,5) + '.' + SUBSTRING(rgEmpre,6,8) + '-' + SUBSTRING(rgEmpre,9,9) AS RG,
SUBSTRING(cicEmpre,1,3) + '.' + SUBSTRING(cicEmpre,4,6) + '.' + SUBSTRING(cicEmpre,7,9) + '-' + SUBSTRING(cicEmpre,10,11) AS CPF
FROM tbl_empregado
ORDER BY cicEmpre