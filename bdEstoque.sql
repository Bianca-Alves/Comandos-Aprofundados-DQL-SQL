----- Criação do banco de dados -----

CREATE DATABASE bdEstoque
USE bdEstoque

----- Criação das tabelas -----

CREATE TABLE tbl_fornecedores (
	id_fornecedor INT PRIMARY KEY NOT NULL,
	nome_fornecedor VARCHAR(50) NOT NULL,
	endereco_fornecedor VARCHAR(100) NOT NULL,
	CNPJ_fornecedor CHAR(14) NOT NULL,
	telefone_fornecedor VARCHAR(11) NOT NULL
);

CREATE TABLE tbl_objetos (
	id_item INT PRIMARY KEY NOT NULL,
	desc_item VARCHAR(200) NOT NULL,
	data_aquisicao_item VARCHAR(10) NOT NULL,
	valor_aquisicao_item MONEY NOT NULL,
	fornecedor_item INT NOT NULL
);

----- Inserção de dados -----

INSERT INTO tbl_objetos (id_item, desc_item, data_aquisicao_item, valor_aquisicao_item, fornecedor_item)
VALUES (1, 'Televisão: Smart TV LED 50" UHD 4K LG 50UN7310PSC Wi-Fi, Bluetooth, HDR, Inteligência Artificial ThinQ AI, Google Assistente, Alexa, Controle Smart Magic.', '16072019', 3.750, 1),
       (2, 'Sofá: O conjunto de sofás Cosmos é a melhor opção de conforto e design para sua família. Disponível em cores variadas, este é uma exclusividade Netsofás.', '10042018', 1.940, 2),
	   (3, 'Fogão: Conta com quatro queimadores, grades robustas de ferro fundido. Foi desenvolvido para levar design e praticidade para uma cozinha moderna e sofisticada.', '24062020', 1.298, 3),
	   (4, 'Mesa: A mesa Alana com 4 cadeiras une a utilidade nos momentos de refeição à elegância das linhas retas e detalhes amadeirados.', '15082020', 1.330, 2),
	   (5, 'Microondas: Com 26 litros de capacidade, o micro-ondas Philco PMO26 possibilita o preparo de refeições para toda a família.', '07032020', 520, 1)

INSERT INTO tbl_fornecedores (id_fornecedor, nome_fornecedor, endereco_fornecedor, CNPJ_fornecedor, telefone_fornecedor)
VALUES (1, 'Casas Bahia', 'R. Prof. João de Lima Paiva, 65 - Guaianases, São Paulo - SP, 08411-020', '59291534000175', '1125512800'),
       (2, 'Marabraz', 'Av. Souza Ramos, 413 - Guaianases, São Paulo - SP, 08490-490', '01781795000185', '1148989842'),
	   (3, 'Lojas CEM', 'Av. Souza Ramos, 245 - Guaianases, São Paulo - SP, 08490-490', '56642960000100', '1122852644')

----- Realização de consultas -----

SELECT id_item AS ID, desc_item AS 'Descrição do item', SUBSTRING(data_aquisicao_item,1,2) + '/' + SUBSTRING(data_aquisicao_item,3,2) + '/' + SUBSTRING(data_aquisicao_item,5,8) AS 'Data',
'R$ ' + CAST(valor_aquisicao_item AS VARCHAR) AS 'Valor', fornecedor_item AS 'Fornecedor'
FROM tbl_objetos

SELECT id_fornecedor AS 'ID', nome_fornecedor AS 'Nome', endereco_fornecedor AS 'Endereço',
SUBSTRING(CNPJ_fornecedor,1,2) + '.' + SUBSTRING(CNPJ_fornecedor,3,3) + '.' + SUBSTRING(CNPJ_fornecedor,6,3) + '/' + SUBSTRING(CNPJ_fornecedor,9,4) + '-' + SUBSTRING(CNPJ_fornecedor,13,14) AS 'CNPJ',
'(' + SUBSTRING(telefone_fornecedor,1,2) + ') ' + SUBSTRING(telefone_fornecedor,3,4) + '-' + SUBSTRING(telefone_fornecedor,7,4) AS 'Telefone'
FROM tbl_fornecedores

SELECT id_item AS 'ID', desc_item AS 'Descrição do item'
FROM tbl_objetos
WHERE data_aquisicao_item = '15082020'

SELECT SUM(valor_aquisicao_item) AS 'Valor Total'
FROM tbl_objetos

SELECT MAX(valor_aquisicao_item) AS 'Valor Máximo', MIN(valor_aquisicao_item) AS 'Valor Mínimo'
FROM tbl_objetos

SELECT DATEDIFF (DAY, 1672019, GETDATE()) + DATEDIFF (MONTH, 1672019, GETDATE()) + DATEDIFF (YEAR, 1672019, GETDATE()) AS 'Diferença Item 1',
DATEDIFF (DAY, 1042018, GETDATE()) + DATEDIFF (MONTH, 1042018, GETDATE()) + DATEDIFF (YEAR, 1042018, GETDATE()) AS 'Diferença Item 2',
DATEDIFF (DAY, 2462020, GETDATE()) + DATEDIFF (MONTH, 2462020, GETDATE()) + DATEDIFF (YEAR, 2462020, GETDATE()) AS 'Diferença Item 3',
DATEDIFF (DAY, 1582020, GETDATE()) + DATEDIFF (MONTH, 1582020, GETDATE()) + DATEDIFF (YEAR, 1582020, GETDATE()) AS 'Diferença Item 4',
DATEDIFF (DAY, 0732020, GETDATE()) + DATEDIFF (MONTH, 0732020, GETDATE()) + DATEDIFF (YEAR, 0732020, GETDATE()) AS 'Diferença Item 5'