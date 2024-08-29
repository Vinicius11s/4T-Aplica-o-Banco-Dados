USE AVENTURAS;

/*procedure criptografada*/
CREATE PROCEDURE teste_cripto1 (@tipo_cliente as int)
with encryption
as
Begin
select * from Clientes where idTipo=@tipo_cliente
End

/*comando listar procedure*/
exec sp_helptext teste_cripto1


/*Executar Store procedure*/
exec sp_nome_idade

/*Excluir procedure*/
drop procedure teste_cripto1


/*1* criar procedure para mostrar nome e idade de todos funcionarios*/
create procedure sp_nome_idade
as 
Begin
select Nome, DATEDIFF(YEAR, DataNac, GETDATE()) AS IDADE FROM Funcionarios; 
End

/*2 altere a procedure criada para mostrar os funcionarios cujo id seja = 1*/
alter procedure sp_nome_idade
as 
Begin
select * from Funcionarios where IDFuncionario = 1
End

/*3 crie uma procedure que faça uma juncao de 3 tabelas*/
create procedure juncao4(@NomeFunc varchar(20), @DescricaoTerrit varchar(20))
as
Begin
SELECT
	Funcionarios.Nome,
	Funcionarios.Sobrenome,
	Territorios.DescricaoTerritorio
FROM
	Funcionarios
INNER JOIN 
	[Funcionarios-Territorios] ON Funcionarios.IDFuncionario = [Funcionarios-Territorios].IDFuncionario
INNER JOIN
	Territorios ON Territorios.IDTerritorio = [Funcionarios-Territorios].IDTerritorio
WHERE
	Funcionarios.Nome = @NomeFunc
	AND Territorios.DescricaoTerritorio = @DescricaoTerrit
END

exec juncao4 'Nancy', 'Wilton';

