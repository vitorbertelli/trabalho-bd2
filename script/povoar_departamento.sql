DELIMITER $$
CREATE PROCEDURE povoar_departamento(IN num_dept INT)
BEGIN
	DECLARE Id INT;
	SET Id = 1;
	WHILE Id <= num_dept DO
		INSERT INTO departamento(dept_id, nome) VALUES (Id, CONCAT('Departamento - ',CAST(Id AS CHAR)));
		SET Id = Id + 1;
	END WHILE;
END $$
DELIMITER ;