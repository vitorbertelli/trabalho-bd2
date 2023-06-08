# QUANTIDADE FUNCIONÁRIOS COM O SOBRENOME MOREIRA P/ DEPARTAMENTO
SELECT d.nome 'Departamento', COUNT(*) 'Moreira'
FROM funcionario f, departamento d
WHERE f.dept_id = d.dept_id AND f.sobrenome = 'Moreira'
GROUP BY d.dept_id
ORDER BY d.dept_id;