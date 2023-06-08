DELIMITER $$
CREATE PROCEDURE povoar_curso(IN num_curso INT)
BEGIN
	DECLARE Id INT DEFAULT 1;
    DECLARE num_inst INT DEFAULT (SELECT COUNT(*) FROM instrutor);
	WHILE Id <= num_curso DO
		INSERT INTO curso(curso_id, nome, inst_id) VALUES (Id, CONCAT('Curso - ',CAST(Id AS CHAR)), FLOOR(1 + (RAND() * 20)));
		SET Id = Id + 1;
	END WHILE;
END $$
DELIMITER ;