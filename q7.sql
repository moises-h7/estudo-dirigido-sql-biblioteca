SELECT e.nome AS editora, COUNT(l.livro_id) AS total_livros
FROM livros l
JOIN editoras e ON l.editora_id = e.editora_id
GROUP BY e.nome
HAVING COUNT(l.livro_id) > 2;