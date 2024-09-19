USE Estacionamento;
/*1. Elabore uma consulta que mostre o nome do cliente, sua idade, e de acordo com a idade,
mostre a mensagem se ele � obrigado ou n�o � ter t�tulo de eleitor ( pessoas com 18 anos ou
mais s�o obrigados a ter t�tulo de eleitor)*/
SELECT
	cli_nome,
	DATEDIFF(YEAR, cli_dtNascimento, GETDATE()) AS Idade,
CASE
	when DATEDIFF(YEAR, cli_dtNascimento, GETDATE()) > 18
		then ('Voc� � obrigado � ter t�tulo de eleitor')
	else 
		('Voc� � obrigado � ter t�tulo de eleitor')
END AS StatusTituloEleitor
FROM Cliente

/*2. Elabore uma consulta que mostre a placa, a cor, a descri��o do modelo e a marca do
ve�culo, al�m de uma mensagem �Marca japonesa� para Honda e Toyota, �Marca americana� para
Ford, �Marca alem� para Volkswagem e �Outras nacionalidades� para as demais marcas.*/

SELECT
	vei_placa,
	vei_cor,
	Modelo.mod_descricao,
	Marca.mar_descricao,
CASE
	when mar_descricao IN ('Honda', 'Toyota') then 'Marca Japonesa'
	when mar_descricao IN ('Ford') then 'Marca Alem�'
	else 'Outras nacionalidades'
END AS
	RegiaoMarca 
FROM
	Veiculo
INNER JOIN 
	Modelo ON Modelo.mod_codigo = Veiculo.mod_codigo
INNER JOIN
	Marca ON Marca.mar_codigo = Modelo.mar_codigo

/*3. Para resolver este exerc�cio, insira o campo valor_estacionamento na tabela p�tio,
todos iniciando com valor 1. Em seguida, utilizando o comando while, altere o valor
deste campo, aumentando em 5% do valor atual, enquanto a somat�ria do campo
valor_estacionamento seja menor que 500.*/

ALTER TABLE Patio
ADD valor_estacionamento DECIMAL(8, 2); -- Adicionando a coluna com tipo DECIMAL para suportar valores fracion�rios.

UPDATE Patio
SET valor_estacionamento = 1; -- Inicializando todos os valores em 1.

-- Loop WHILE para aumentar o valor em 5% at� que a soma dos valores seja >= 500.
WHILE (SELECT SUM(valor_estacionamento) FROM Patio) < 500
BEGIN
    UPDATE Patio
    SET valor_estacionamento = valor_estacionamento * 1.05; -- Aumentando em 5% o valor.
END;


select * from Patio;

	
	





