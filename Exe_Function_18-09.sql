/*1) Crie uma fun��o que retorne o nome completo de
um estado a partir de sua sigla*/

/*create function fun_NomeCompleto (@sigla varchar(50))
returns varchar(50)
as
Begin
	declare @nomeEstado varchar(50);

	SET @sigla = UPPER(@sigla);

	SET @nomeEstado =
		case @sigla
			WHEN 'AC' THEN 'Acre'
			WHEN 'AL' THEN 'Alagoas'
			WHEN 'AP' THEN 'Amap�'
			WHEN 'AM' THEN 'Amazonas'
			WHEN 'BA' THEN 'Bahia'
			WHEN 'CE' THEN 'Cear�'
			WHEN 'DF' THEN 'Distrito Federal'
			WHEN 'ES' THEN 'Esp�rito Santo'
			WHEN 'GO' THEN 'Goi�s'
			WHEN 'MA' THEN 'Maranh�o'
			WHEN 'MT' THEN 'Mato Grosso'
			WHEN 'MS' THEN 'Mato Grosso do Sul'
			WHEN 'MG' THEN 'Minas Gerais'
			WHEN 'PA' THEN 'Par�'
			WHEN 'PB' THEN 'Para�ba'
			WHEN 'PR' THEN 'Paran�'
			WHEN 'PE' THEN 'Pernambuco'
			WHEN 'PI' THEN 'Piau�'
			WHEN 'RJ' THEN 'Rio de Janeiro'
			WHEN 'RN' THEN 'Rio Grande do Norte'
			WHEN 'RS' THEN 'Rio Grande do Sul'
			WHEN 'RO' THEN 'Rond�nia'
			WHEN 'RR' THEN 'Roraima'
			WHEN 'SC' THEN 'Santa Catarina'
			WHEN 'SP' THEN 'S�o Paulo'
			WHEN 'SE' THEN 'Sergipe'
			WHEN 'TO' THEN 'Tocantins'
			ELSE 'Sigla inv�lida'
		END
	Return @nomeEstado;
END;

SELECT dbo.fun_NomeCompleto('SP') as NomeEstado;*/


/*2) Crie uma fun��o que retorne a maior nota de um determinado aluno*/
/*create function fun_maiorNota (@ra int)
Returns decimal (8,2)
as
Begin
	declare @maior decimal (8,2);

	select @maior = MAX(nota)
	from historico
	where ra = @ra;
	return @maior;
End

select dbo.fun_maiorNota(6130001) as MaiorNota;*/


/*3) Elabore uma fun��o que calcule a �rea de um tri�ngulo*/
/*create function fun_AreaTriangulo (@base decimal(10,2), @altura decimal(10,2))
returns decimal (10,2)
as 
Begin
	Declare @area decimal (10,2);

	set @area = (@base * @altura) / 2;

	Return @area;
End;
SELECT dbo.fun_AreaTriangulo(5, 10) AS AreaTriangulo;*/


/*4) Elabore uma fun��o que deixe uma palavra com a primeira e a �ltima letra
mai�scula*/
/*create function fun_Maiuscula(@palavra as varchar(30))
returns varchar(30)
as
Begin
	Declare @resultadoFinal varchar(30)
	Declare @primeiraLetra varchar(1)
	Declare @meio varchar(30)
	Declare @ultimaLetra varchar(1)

	IF LEN(@palavra) > 0
	Begin
		SET @primeiraLetra = UPPER(LEFT(@palavra, 1));
		SET @ultimaLetra = UPPER(RIGHT(@palavra, 1));
		
		IF LEN(@palavra) > 2
		Begin
	 	    -- Extrai o meio da palavra, excluindo a primeira e a �ltima letra, e converte para min�sculas
			SET @meio = LOWER(SUBSTRING(@palavra, 2, LEN(@palavra) - 2));
		END
		ELSE
		Begin
			SET @meio = '';
		END

		SET @resultadoFinal = @primeiraLetra + @meio + @ultimaLetra;
	END
	ELSE
	Begin
		SET @resultadoFinal = '';
	END
	Return @resultadoFinal;
END

SELECT dbo.fun_Maiuscula('exemplo') AS PalavraFormatada;*/

/*5) Crie uma fun��o que retorne o nome do professor de uma determinada disciplina*/
/*select * from disciplinas*/
/*
create function fun_nomeProfessorDisciplina(@cod_disc INT)
returns varchar(50)
as 
Begin
	declare @nome varchar(50)
	select @nome = nome_pro
	from professores p
	inner join turmas t on t.cod_pro = p.cod_pro
	where cod_disc = @cod_disc;

	Return @nome
End

SELECT dbo.fun_nomeProfessorDisciplina(1) AS NomeProfessor;
select * from professores
select * from turmas*/