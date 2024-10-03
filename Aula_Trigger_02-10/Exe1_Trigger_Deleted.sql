/*crie uma nova trigger faça o mesmo procedimento para a tabela professores, onde a
informação a ser registrada na tabela de ocorrências, é o nome do professor*/

create trigger trg_professores_exclui
ON Professores
FOR DELETE AS
BEGIN
	DECLARE
		@info varchar(50),
		@data date
	SELECT @info = nome_pro, @data = GETDATE() FROM deleted
	insert ocorrencias
	values ('Exclusão','Professores', @info, @data)
END

SELECT * FROM professores;
delete from professores where cod_pro=11;
select * from ocorrencias;
