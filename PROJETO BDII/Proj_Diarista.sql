/* Lógico_1: */
CREATE DATABASE PROJ_DIARISTA;
Use  PROJ_DIARISTA;
CREATE TABLE DIARISTA (
	num_reg INT PRIMARY KEY NOT NULL auto_increment,
    nome VARCHAR (50) NOT NULL,
    cpf_diarista VARCHAR (20) NOT NULL,
    telefone VARCHAR (20) NOT NULL,
    nascimento VARCHAR (15)NOT NULL,
    endereco VARCHAR (100) NOT NULL
);

INSERT INTO `DIARISTA` VALUES (1,'STEPHANIE','12345678910','11986574789','1980-05-20','Rua da pamonha, 32'),
(2,'SARA','10254872698','12986528745','1994-06-11','Rua da esperança, 102'),
(3,'JAQUELINE','87459635152','21985217853','1987-08-12','Rua da vida, 507'),
(4,'VITÓRIA','75891845781','11954736429','1983-09-22','Rua da longevidade, 201'),
(5,'SOLANGE','45632178925','11974125671','1992-10-30','Rua da vida, 471');

SELECT * FROM DIARISTA;

CREATE TABLE CLIENTE (
	id_cliente INT PRIMARY KEY NOT NULL auto_increment,
    cpf_cliente VARCHAR (20) NOT NULL,
    nome VARCHAR(50) NOT NULL,
    telefone VARCHAR(20) NOT NULL,
    FK_RESIDENCIA_id_residencia NUMERIC NOT NULL
);

INSERT INTO `CLIENTE` VALUES (1,'45874125845','RAFAEL','119784563214',1),
(2,'78415245765','JOÃO','11942014721',2),
(3,'14725836978','VICTOR','11947852145',3),
(4,'10245786514','ROSANGELA','2145787841',4),
(5,'01457896514','PRISCILA','45932178925',5);

CREATE TABLE RESIDENCIA (
    logradouro VARCHAR (100) NOT NULL,
    cep NUMERIC (15) NOT NULL,
    bairro VARCHAR (30) NOT NULL,
    cidade VARCHAR (50) NOT NULL,
    id_residencia  INT PRIMARY KEY NOT NULL auto_increment,
    tamanho_total INT NOT NULL,
    complemento VARCHAR (100) NULL
);

INSERT INTO `RESIDENCIA` VALUES ('Rua do milho, 457', 07414023,'Mooca', 'São Paulo',1,80, 'Ap 21'),
('Rua do morango, 247', 08080024,'Vila Galvão', 'Guarulhos',2,95,''),
('Rua da paçoca, 471', 05050021,'Vila Galvão', 'Guarulhos',3,156,''),
('Rua do brigadeiro, 200', 09090070,'Centro', 'São Paulo',4,520,'Ap 130'),
('Rua da sorte, 300', 02552072,'Cabuçu', 'Guarulhos',5,15,'');

CREATE TABLE SERVICO (
    ordem_serv INT PRIMARY KEY NOT NULL auto_increment,
    tempo INTEGER NOT NULL,
    data_inicial VARCHAR(20) NOT NULL,
    data_final VARCHAR(20) NOT NULL,
    transporte DECIMAL(10,2),
    taxa DECIMAL(10,2)
);


CREATE TABLE AVALIA (
    id_avalia INT PRIMARY KEY NOT NULL auto_increment,
    nota_cliente INTEGER NOT NULL,
    nota_diarista INTEGER NOT NULL,
    descricao VARCHAR(100) NULL,
    FK_CLIENTE_id_cliente INT,
    FK_DIARISTA_num_reg INT,
    FK_SERVICO_ordem_serv NUMERIC
);


CREATE TABLE _AGENDA_CLIENTE_SERVICO_DIARISTA (
    FK_CLIENTE_cpf_cliente NUMERIC,
    FK_SERVICO_ordem_serv NUMERIC,
    FK_DIARISTA_num_reg NUMERIC
);

CREATE TABLE PASSAR_ROUPA (
    id_passar_roupa INT PRIMARY KEY NOT NULL auto_increment,
    quantidade NUMERIC(10) NOT NULL,
    descricao VARCHAR(100) NULL,
	valor_serv DECIMAL(10,2),
    FK_SERVICO_ordem_serv NUMERIC
);

CREATE TABLE LIMPEZA (
    id_limpeza INT PRIMARY KEY NOT NULL auto_increment,
    num_comodo INT NOT NULL,
    num_banheiro INT NOT NULL,
    num_quarto INT NOT NULL,
    FK_SERVICO_ordem_serv NUMERIC
);
 SELECT * FROM CLIENTE