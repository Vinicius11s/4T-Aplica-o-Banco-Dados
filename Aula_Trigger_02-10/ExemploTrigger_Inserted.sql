/*Criando a trigger que quando houver um insert na tabela 
Disciplinas ela vai executar automaticamente e gerar um log de dados na tebela ocorrencias*/

create trigger trg_disciplina
ON Disciplinas
FOR INSERT AS
BEGIN
	DECLARE
		@info varchar(50),
		@data date
	SELECT @info = nome_disc, @data = GETDATE() FROM INSERTED
	insert ocorrencias values
('Inserção','disciplinas',@info,@data)
END*/

insert into disciplinas values (16, 'Estrutura de Dados', 60)
SELECT * FROM ocorrencias;
