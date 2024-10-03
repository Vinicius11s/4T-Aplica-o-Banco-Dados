/*crie uma nova trigger fa�a o mesmo procedimento para a tabela professores, onde a
informa��o a ser registrada na tabela de ocorr�ncias, � o nome do professor*/

create trigger trg_professores
ON professores
FOR INSERT AS
BEGIN
	DECLARE
		@info varchar(50),
		@data date
	SELECT @info = nome_pro, @data = GETDATE()
	FROM INSERTED

	insert ocorrencias
	values('Inser��o','professores',@info,@data)
END

insert into professores values (11, 'Alisson Kunh', 'Rua V', 'Presidente Prudente')
SELECT * FROM ocorrencias;