CREATE DATABASE IF NOT EXISTS db_epis;
USE db_epis;
CREATE TABLE Aluno (
id_aluno INT AUTO_INCREMENT PRIMARY KEY,
nome_aluno VARCHAR(80) NOT NULL,
CPF_aluno VARCHAR(100), 
Email_aluno VARCHAR(100),
RA_aluno VARCHAR(100),
Turma_aluno VARCHAR(100),
Periodo_aluno VARCHAR(100)
);
CREATE TABLE Funcionario (
Id_funcionario INT AUTO_INCREMENT PRIMARY KEY,
Nome_funcionario VARCHAR(80) NOT NULL,
Email_funcaionario VARCHAR(14),
Turno_funcionario VARCHAR(20)
);
CREATE TABLE EPIs (
Id_epis INT AUTO_INCREMENT PRIMARY KEY,
Nome_epis VARCHAR(100),
Categoria_epis VARCHAR(100),
Qtd_epis VARCHAR(100),
Data_Val DATE
);
CREATE TABLE Fornecedor (
Id_fornecedor INT AUTO_INCREMENT PRIMARY KEY,
Nome_forecedor VARCHAR(100),
Data_compra DATE ,
valor REAL,
Ativo VARCHAR(100)
);
CREATE TABLE Usuario (
Id_usuario INT AUTO_INCREMENT PRIMARY KEY, 
Email_usuario VARCHAR(100),
Senha_usuario VARCHAR(100)
);