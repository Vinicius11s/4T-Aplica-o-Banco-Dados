USE AVENTURAS;

/*Estrutura Case / Faixa de idade dos Funcionarios e a sua Situação*/
select
	Nome,
	Sobrenome,
	DATEDIFF(Year, DataNac, GETDATE()) AS idade,
case
	when DATEDIFF(Year, DataNac, GETDATE()) <= 20 then 'Jovem'
	when DATEDIFF(Year, DataNac, GETDATE()) between 21 and 50 then 'Adulto'
	when DATEDIFF(Year, DataNac, GETDATE()) between 51 and 70 then 'Velho'
	when DATEDIFF(Year, DataNac, GETDATE()) > 70 then 'Idoso'
	else 'Muito Velho'
end as Situacao
FROM Funcionarios;

------------------------------//------------------


/*Estrutura While / Criando uma tabela 'Numeros' e adicionando nela valores de
1 a 50*/

DECLARE @contador INT = 0;

-- criando a tabela que será populada
CREATE TABLE Numeros (numero Int);
WHILE @contador < 50
BEGIN
SET @contador += 1;
INSERT INTO Numeros VALUES (@contador);
END
SELECT * FROM Numeros; 