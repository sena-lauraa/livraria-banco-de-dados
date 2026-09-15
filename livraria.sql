CREATE DATABASE IF NOT EXISTS biblioteca;
USE biblioteca;

CREATE TABLE autor (
    id_autor INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    nacionalidade VARCHAR(50),
    PRIMARY KEY (id_autor)
);

CREATE TABLE categoria (
    id_categoria INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL UNIQUE,
    PRIMARY KEY (id_categoria)
);

CREATE TABLE livro (
    id_livro INT NOT NULL AUTO_INCREMENT,
    id_categoria INT NOT NULL,
    titulo VARCHAR(150) NOT NULL,
    isbn VARCHAR(13) UNIQUE,
    ano_publicacao INT,
    editora VARCHAR(100),
    PRIMARY KEY (id_livro),
    FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria)
);

CREATE TABLE livro_autor (
    id_livro INT NOT NULL,
    id_autor INT NOT NULL,
    PRIMARY KEY (id_livro, id_autor),
    FOREIGN KEY (id_livro) REFERENCES livro(id_livro) ON DELETE CASCADE,
    FOREIGN KEY (id_autor) REFERENCES autor(id_autor) ON DELETE CASCADE
);

CREATE TABLE exemplar (
    id_exemplar INT NOT NULL AUTO_INCREMENT,
    id_livro INT NOT NULL,
    codigo_barras VARCHAR(50) NOT NULL UNIQUE,
    status ENUM('Disponivel', 'Emprestado', 'Em Manutencao', 'Perdido') DEFAULT 'Disponivel',
    PRIMARY KEY (id_exemplar),
    FOREIGN KEY (id_livro) REFERENCES livro(id_livro) ON DELETE CASCADE
);

CREATE TABLE leitor (
    id_leitor INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    telefone VARCHAR(15) NOT NULL,
    cpf VARCHAR(11) NOT NULL UNIQUE,
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status ENUM('Ativo', 'Bloqueado') DEFAULT 'Ativo',
    PRIMARY KEY (id_leitor)
);

CREATE TABLE emprestimo (
    id_emprestimo INT NOT NULL AUTO_INCREMENT,
    id_exemplar INT NOT NULL,
    id_leitor INT NOT NULL,
    data_emprestimo TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    data_devizao_prevista DATE NOT NULL,
    data_devolucao_real TIMESTAMP NULL,
    multa DECIMAL(8, 2) DEFAULT 0.00,
    status ENUM('Em Andamento', 'Concluido', 'Atrasado') DEFAULT 'Em Andamento',
    PRIMARY KEY (id_emprestimo),
    FOREIGN KEY (id_exemplar) REFERENCES exemplar(id_exemplar),
    FOREIGN KEY (id_leitor) REFERENCES leitor(id_leitor)
);

INSERT INTO categoria (nome) VALUES ('Ficção Científica'), ('Romance'), ('Tecnologia');
INSERT INTO autor (nome, nacionalidade) VALUES ('J.R.R. Tolkien', 'Britânico'), ('Machado de Assis', 'Brasileiro');

INSERT INTO livro (id_categoria, titulo, isbn, ano_publicacao, editora) VALUES 
(2, 'Dom Casmurro', '9788535902777', 1899, 'Livraria Garnier'),
(1, 'O Senhor dos Anéis', '9788535902784', 1954, 'Allen & Unwin');

INSERT INTO livro_autor (id_livro, id_autor) VALUES (1, 2), (2, 1);

INSERT INTO exemplar (id_livro, codigo_barras, status) VALUES 
(1, 'EX-001-DC', 'Disponivel'),
(1, 'EX-002-DC', 'Emprestado'),
(2, 'EX-001-SDA', 'Disponivel');

INSERT INTO leitor (nome, email, telefone, cpf) VALUES 
('Lucas Mendes', 'lucas@email.com', '11988881111', '12312312344'),
('Camila Rocha', 'camila@email.com', '11977772222', '44432132111');

INSERT INTO emprestimo (id_exemplar, id_leitor, data_devizao_prevista) VALUES 
(2, 1, '2026-09-25');