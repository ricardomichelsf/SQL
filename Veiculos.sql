CREATE DATABASE AC2

USE AC2

CREATE TABLE VEICULOS 

(
PLACA	VARCHAR(100)	UNIQUE,
MODELO	VARCHAR(100)	NOT NULL,
VERSAO	VARCHAR(100)	NOT NULL,
CAMBIO	VARCHAR(100),	
MONTADORA	VARCHAR(100)	NOT NULL,
PAIS	VARCHAR(100)	NOT NULL,
DATA_CADASTRO	DATETIME,
DATA_DOCUMENTO	DATE,	 
ANO	INT,	 
COR	VARCHAR(100),
VALOR_FIPE	DECIMAL(10,8))

CREATE TABLE MECANICO 

(
CPF	VARCHAR(100)	CONSTRAINT CPF UNIQUE,
PRIMEIRO_NOME	VARCHAR(100)	NOT NULL,
SEGUNDO_NOME	VARCHAR(100)	NOT NULL,
NASCIMENTO	DATE	NOT NULL,
MONTADORA_PRINCIPAL	VARCHAR(100),	 
SALARIO	DECIMAL(10,8),
DATA_CONTRATACAO	DATE	NOT NULL,
DATA_DEMISSAO	DATE)	 

ALTER TABLE MECANICO ALTER COLUMN SALARIO DECIMAL(20,8)
ALTER TABLE VEICULOS ALTER COLUMN VALOR_FIPE DECIMAL(20,8)

ALTER TABLE VEICULOS DROP COLUMN CAMBIO

ALTER TABLE VEICULOS ADD ATIVO BIT

INSERT INTO VEICULOS (PLACA, MODELO, VERSAO, MONTADORA, PAIS, DATA_CADASTRO, DATA_DOCUMENTO, ANO, COR, VALOR_FIPE, ATIVO)
VALUES 

('XXX-XX1','VERSA','X1','NISSAN','COREIA DO SUL','2021-01-01','2005-01-01',2005,'PRETO',30000,1),
('XXX-XX2','LOGAN','A1','RENAULT','FRANCA','2020-02-01','2001-01-01',2001,'AZUL',10000,1),
('XXX-XX3','VERSA','X1','NISSAN','COREIA DO SUL','2021-01-01','2005-01-11',2005,'BRANCO',30000,1),
('XXX-XX4','VERSA','X1','NISSAN','COREIA DO SUL','2018-02-01','2005-04-01',2005,'BRANCO',30000,1),
('XXX-XX5','VERSA','X1','NISSAN','COREIA DO SUL','2010-01-01','2005-07-01',2005,'VERMELHO',30000,1),
('AAA-BBB1','KA','L','FORD','EUA','2010-01-01','2020-07-01',2020,'VERMELHO',50000,1 

)

INSERT INTO MECANICO VALUES

('34030403034', 'JAIR', 'PEREIRA', '14/01/1982', 'FORD', 3000, '01/01/2005', ''),
('34030403035', 'CELSO', 'DIAS', '27/08/1992', 'NISSAN', 5000, '01/01/2005', '11/01/2006'),
('34030403036', 'LUCA', 'LOPES', '26/08/1999', 'HYUNDAI', 6000, '01/01/2005',''),
('34030403037', 'ARNALD', 'HILL', '11/01/1988', 'PEGOUT', 1200, '01/01/2005',''),
('34030403042', 'LUAN', 'OTTO', '14/01/1982', 'BMW', 12000, '06/01/2019', '06/01/2020')


SELECT CPF, DATA_CONTRATACAO, DATA_DEMISSAO
FROM MECANICO
WHERE DATA_DEMISSAO != ''

SELECT PRIMEIRO_NOME, SEGUNDO_NOME 
FROM MECANICO
WHERE NASCIMENTO BETWEEN '1988-01-01' AND '1999-12-31'

SELECT PRIMEIRO_NOME, SALARIO, MONTADORA_PRINCIPAL
FROM MECANICO
WHERE SALARIO > 1600 AND
(MONTADORA_PRINCIPAL = 'FORD' OR MONTADORA_PRINCIPAL = 'NISSAN' OR MONTADORA_PRINCIPAL = 'PEGOUT')


SELECT PLACA, PAIS, MODELO, MONTADORA 
FROM VEICULOS
WHERE COR = 'VERMELHO' AND VALOR_FIPE > 90000