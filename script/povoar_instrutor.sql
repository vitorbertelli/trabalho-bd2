DELIMITER $$
CREATE PROCEDURE povoar_instrutor(IN num_inst INT)
BEGIN
	DECLARE Id INT;
	SET Id = 1;
	WHILE Id <= num_inst DO
		INSERT INTO instrutor(inst_id, nome) VALUES (Id, CONCAT('Instrutor - ',CAST(Id AS CHAR)));
		SET Id = Id + 1;
	END WHILE;
END $$
DELIMITER ;