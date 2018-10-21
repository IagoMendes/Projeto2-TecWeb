CREATE DATABASE IF NOT EXISTS teepo;
USE teepo;

CREATE TABLE categorias (
	idCategoria INT(5) PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(32));

CREATE TABLE notas (
	idNota INT(5) PRIMARY KEY AUTO_INCREMENT,
    conteudo TEXT,
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    data_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    idCategoria INT(5),  
    FOREIGN KEY(idCategoria) REFERENCES categorias(idCategoria));
    
SET GLOBAL time_zone = '-03:00';