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
CA_epis int,
Qtd_epis VARCHAR(100),
Qtd_entrega VARCHAR(100),
Data_devolucao DATE,
Data_Val DATE,
Id_inspecao INT,
FOREIGN KEY (Id_inspecao) 
REFERENCES inspecao_epi (Id_inspecao)
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
CREATE TABLE inspecao_epi (
Id_inspecao INT AUTO_INCREMENT PRIMARY KEY,
Data_inspecao DATE,
Resultado_inspecao VARCHAR(20)
);
CREATE TABLE entrega(
id_entrega      INT AUTO_INCREMENT PRIMARY KEY,
Id_funcionario  INT NOT NULL,
id_epi          INT NOT NULL,
id_estoque      INT,
dt_entrega      DATE NOT NULL,
dt_devolucao    DATE,   
assinatura      BOOLEAN DEFAULT FALSE NOT NULL,
observacao      TEXT,
FOREIGN KEY (Id_funcionario) 
REFERENCES funcionario (Id_funcionario),
FOREIGN KEY (id_epi) 
REFERENCES EPIs (Id_epis)
ON DELETE RESTRICT
);
CREATE INDEX idx_epi_entrega ON epi(dt_entrega);

UPDATE EPIs 
set Qtd_epi = Qtd_epi - Qtd_entrega
where assinatura = TRUE 

