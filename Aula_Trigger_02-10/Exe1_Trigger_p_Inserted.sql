/*crie uma nova trigger faça o mesmo procedimento para a tabela professores, onde a
informação a ser registrada na tabela de ocorrências, é o nome do professor*/

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
	values('Inserção','professores',@info,@data)
END

insert into professores values (11, 'Alisson Kunh', 'Rua V', 'Presidente Prudente')
SELECT * FROM ocorrencias;