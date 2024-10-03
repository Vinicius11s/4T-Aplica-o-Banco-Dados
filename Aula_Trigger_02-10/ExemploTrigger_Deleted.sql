/*Neste exemplo, ser� criada uma trigger para registrar as
ocorr�ncias de exclus�o na tabela �Disciplinas�*/

create trigger trg_disciplina_exclui
ON Disciplinas
FOR DELETE
AS
BEGIN
	DECLARE
		@info varchar(50),
		@data date
	SELECT @info = nome_disc, @data = GETDATE() FROM Deleted
	insert ocorrencias
	values('Exclus�o','disciplinas',@info,@data)
END

SELECT * FROM disciplinas;
delete from disciplinas where cod_disc=16;
select * from ocorrencias;