/*Crie um trigger para adicionar a palavra “Sr(a)” ao nome de pessoas que nasceram há mais
de 35 anos */

ALTER TRIGGER trg_adcNome_35
ON CLIENTE
FOR INSERT, UPDATE
AS
BEGIN
	UPDATE CLIENTE
		SET nome = 
			CASE 
				WHEN DATEDIFF(YEAR, datanascimento, GETDATE()) > 35 THEN 
					'Sr(a)' + nome 
			END
	END;


	insert CLIENTE VALUES(8, 'Jurandir', '1800-12-05','46134160865')
	select * from CLIENTE