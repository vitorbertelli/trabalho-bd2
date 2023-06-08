# NOME E QUANTIDADE DE CURSOS DO FUNCIONÁRIO QUE ESTÁ CADASTRADO EM MAIS CURSOS
SELECT f.nome 'Nome', COUNT(fc.curso_id) 'Cursos' 
FROM funcionario f, funcionario_curso fc
WHERE f.func_id = fc.func_id
GROUP BY f.func_id
HAVING COUNT(fc.curso_id) = (
    SELECT COUNT(curso_id)
    FROM funcionario_curso
    GROUP BY func_id
    ORDER BY COUNT(curso_id) DESC
    LIMIT 1
);