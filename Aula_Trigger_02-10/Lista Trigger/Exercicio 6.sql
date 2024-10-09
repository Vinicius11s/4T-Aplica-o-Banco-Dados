/*Crie um trigger para adicionar a palavra “Sr(a)” ao nome de pessoas que nasceram há mais
de 35 anos */

ALTER TRIGGER trg_adcNome_35
ON CLIENTE
FOR INSERT, UPDATE
AS
BEGIN
	UPDATE C
	SET nome = 
		CASE 
			WHEN DATEDIFF(YEAR, I.datanascimento, GETDATE()) > 35 THEN 
				'Sr(a) ' + I.nome
			ELSE 
				I.nome
		END
	FROM CLIENTE C
	JOIN INSERTED I ON C.id = I.id;
END;

INSERT INTO CLIENTE (id, nome, datanascimento, cpf)
VALUES (8, 'Jurandir', '1800-12-05', '46134160865');

SELECT * FROM CLIENTE;
