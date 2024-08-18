USE AVENTURAS;

/*Liste o nome do funcionário mais velho da região Eastern*/
SELECT
	Nome, Sobrenome
FROM
	Funcionarios
WHERE 
	DataNac = (
SELECT
	MIN(f.DataNac)
FROM
	Funcionarios f
INNER JOIN 
	[Funcionarios-Territorios] ft ON f.IDFuncionario = ft.IDFuncionario
INNER JOIN 
	Territorios t ON ft.IDTerritorio = t.IDTerritorio
INNER JOIN 
	Regiao r ON t.IDRegiao = r.IDRegiao
WHERE
	r.IDRegiao = 1);

/*Liste a descrição do tipo de cliente com o total de compras
maior que a média de todas as vendas realizadas*/
SELECT
	ct.TipoCliente
FROM
	[Clientes-Tipo] ct
INNER JOIN 
	Clientes c ON ct.idTipo = c.idTipo
INNER JOIN 
	Ordens o ON o.IDCliente = c.IDCliente
INNER JOIN
	[Ordens-Detalhes] od ON od.IDOrdem = o.IDOrdem
GROUP BY
	ct.TipoCliente
HAVING 
SUM(od.PrecoUnitario * od.Quantidade) > (
	SELECT AVG (total)
	FROM (
	SELECT
		o.IDOrdem,
		SUM (od.PrecoUnitario * od.Quantidade) AS total 
		FROM
		Ordens o
		INNER JOIN
			[Ordens-Detalhes] od ON o.IDOrdem = od.IDOrdem
		GROUP BY
		o.IDOrdem
	) AS Sub
);


/*3- Liste apenas funcionários (nome e sobrenome) que já
realizaram mais de 15 vendas*/
SELECT
	Nome, Sobrenome
FROM
	Funcionarios
WHERE (
	SELECT COUNT (IDFuncionario)
FROM
	Ordens
WHERE
	Ordens.IDFuncionario = Funcionarios.IDFuncionario)> 15;



/*Exclua todos os clientes que tenham a classificação de
“Cliente bronze”*/

SELECT
	IDTipo
FROM
	[Clientes-Tipo]
WHERE
	TipoCliente = 'Cliente bronze';

DELETE FROM [Ordens-Detalhes]
WHERE
	IDOrdem IN (
    SELECT
		IDOrdem
    FROM
		Ordens
    WHERE
		IDCliente IN (
        SELECT
			IDCliente
        FROM
			Clientes
        WHERE
			IDTipo = 1
    )
);

DELETE FROM Ordens
WHERE
	IDCliente IN (
    SELECT
		IDCliente
    FROM
		Clientes
    WHERE
		IDTipo = 1
);

DELETE FROM Clientes
WHERE
	IDTipo = 1;

SELECT * FROM Clientes;