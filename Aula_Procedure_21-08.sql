USE AVENTURAS;

/*Criação de procedure com select para mostrar nome e idade dos funcionarios dentro*/
create procedure sp_nome_idade
as 
Begin
select Nome, DATEDIFF(YEAR, DataNac, GETDATE()) AS IDADE FROM Funcionarios; 
End

/*Executar Store procedure*/
exec sp_nome_idade

/*Excluir procedure*/
drop procedure sp_teste

