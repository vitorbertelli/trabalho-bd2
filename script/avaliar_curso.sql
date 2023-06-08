DELIMITER $$
CREATE TRIGGER avaliar_curso BEFORE INSERT
ON funcionario_curso
FOR EACH ROW
BEGIN
	IF NEW.avaliacao > 5.0 or NEW.avaliacao < 0 THEN
		SIGNAL SQLSTATE'45000' SET MESSAGE_TEXT = 'A nota para o curso tem que ser entre 0 e 5.';
	END IF;
END $$
DELIMITER ;