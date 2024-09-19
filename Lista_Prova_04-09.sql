USE Universidade;
/*Elabore uma SP, que mostre a média geral dos alunos de uma determinada turma. A turma
deve ser passada por parâmetro*/

create procedure sp_media_geral
	@cod_turma INT
as
Begin
Select
	 (AVG(nota)) AS media_geral
FROM
	historico
INNER JOIN
	alunos ON alunos.ra = historico.ra
WHERE cod_turma = @cod_turma;
END

exec sp_media_geral 3;
