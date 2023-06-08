# AVALIAÇÃO MÉDIA DOS FUNCINÁRIOS P/ DEPARTAMENTO DO CURSO 1:
SELECT dept_id 'Departamento', AVG(avaliacao) 'Média'
FROM funcionario f, funcionario_curso fc
WHERE f.func_id = fc.func_id AND curso_id = 1
GROUP BY dept_id
ORDER BY dept_id;