-- Questão 1
SELECT titulo, ano_publicacao
FROM livros;

-- Questão 2
SELECT COUNT(*) AS total_livros
FROM livros;

-- Questão 3
SELECT e.nome AS editora, AVG(l.ano_publicacao) AS media_ano
FROM livros l
JOIN editoras e ON l.editora_id = e.editora_id
GROUP BY e.nome;

-- Questão 4
SELECT titulo, ano_publicacao
FROM livros
WHERE ano_publicacao = (SELECT MIN(ano_publicacao) FROM livros)
   OR ano_publicacao = (SELECT MAX(ano_publicacao) FROM livros);

-- Questão 5
SELECT titulo, ano_publicacao
FROM livros
WHERE ano_publicacao > 2000;

-- Questão 6
SELECT nome, nacionalidade
FROM autores
ORDER BY nome ASC;

-- Questão 7
SELECT e.nome AS editora, COUNT(l.livro_id) AS total_livros
FROM livros l
JOIN editoras e ON l.editora_id = e.editora_id
GROUP BY e.nome
HAVING COUNT(l.livro_id) > 2;

-- Questão 8
SELECT 
    l.titulo,
    CASE 
        WHEN e.data_devolucao IS NULL THEN 'Emprestado'
        ELSE 'Disponível'
    END AS Status
FROM livros l
LEFT JOIN emprestimos e ON l.livro_id = e.livro_id;

-- Questão 9
SELECT 
    l.titulo,
    a.nome AS autor,
    e.nome AS editora
FROM livros l
INNER JOIN autores a ON l.autor_id = a.autor_id
INNER JOIN editoras e ON l.editora_id = e.editora_id;

-- Questão 10
SELECT l.titulo
FROM livros l
LEFT JOIN autores a ON l.autor_id = a.autor_id
WHERE a.autor_id IS NULL;

