/*crie uma nova trigger fa�a o mesmo procedimento para a tabela professores, onde a
informa��o a ser registrada na tabela de ocorr�ncias, � o nome do professor*/

create trigger trg_professores_exclui
ON Professores
FOR DELETE AS
BEGIN
	DECLARE
		@info varchar(50),
		@data date
	SELECT @info = nome_pro, @data = GETDATE() FROM deleted
	insert ocorrencias
	values ('Exclus�o','Professores', @info, @data)
END

SELECT * FROM professores;
delete from professores where cod_pro=11;
select * from ocorrencias;
