USE biblioteca;

-- 1. LISTAR TODOS OS AUTORES

SELECT *
FROM autor;

-- 2. LISTAR TODOS OS LIVROS
SELECT
    id_livro,
    titulo,
    isbn,
    ano_publicacao,
    editora
FROM livro
ORDER BY titulo;

-- 3. LISTAR OS LIVROS MAIS RECENTES
SELECT
    titulo,
    ano_publicacao
FROM livro
ORDER BY ano_publicacao DESC;

-- 4. LISTAR LIVROS E SUAS CATEGORIAS
SELECT
    l.titulo AS livro,
    c.nome AS categoria
FROM livro l
INNER JOIN categoria c
    ON l.id_categoria = c.id_categoria
ORDER BY c.nome, l.titulo;

-- 5. LISTAR LIVROS E SEUS AUTORES
SELECT
    l.titulo AS livro,
    a.nome AS autor
FROM livro l
INNER JOIN livro_autor la
    ON l.id_livro = la.id_livro
INNER JOIN autor a
    ON la.id_autor = a.id_autor
ORDER BY a.nome;

-- 6. LISTAR AUTORES E A QUANTIDADE DE LIVROS
SELECT
    a.nome AS autor,
    COUNT(la.id_livro) AS quantidade_livros
FROM autor a
LEFT JOIN livro_autor la
    ON a.id_autor = la.id_autor
GROUP BY a.id_autor, a.nome
ORDER BY quantidade_livros DESC;

-- 7. LISTAR OS EXEMPLARES DISPONÍVEIS
SELECT
    ex.codigo_barras,
    l.titulo AS livro,
    ex.status
FROM exemplar ex
INNER JOIN livro l
    ON ex.id_livro = l.id_livro
WHERE ex.status = 'Disponivel';

-- 8. LISTAR TODOS OS EXEMPLARES E SEUS LIVROS
SELECT
    ex.id_exemplar,
    ex.codigo_barras,
    l.titulo AS livro,
    ex.status
FROM exemplar ex
INNER JOIN livro l
    ON ex.id_livro = l.id_livro
ORDER BY l.titulo;

-- 9. LISTAR TODOS OS LEITORES
SELECT
    id_leitor,
    nome,
    email,
    telefone,
    status,
    data_cadastro
FROM leitor
ORDER BY nome;

-- 10. LISTAR LEITORES ATIVOS
SELECT
    nome,
    email,
    telefone
FROM leitor
WHERE status = 'Ativo'
ORDER BY nome;
