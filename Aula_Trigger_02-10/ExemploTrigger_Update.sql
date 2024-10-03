/*Neste exemplo, será criada uma trigger para registrar as
ocorrências de alteração na tabela “Disciplinas”*/

create trigger trg_disciplina_altera
ON Disciplinas
FOR UPDATE
AS
BEGIN
	DECLARE
		@info varchar(50),
		@data date
	SELECT @info = nome_disc, @data = GETDATE() FROM deleted
	insert ocorrencias
	values('Alteração','disciplinas',@info,@data)
END

select * from disciplinas
update disciplinas set nome_disc = 'Matemática Introdutória'
where cod_disc=1select * from ocorrencias